package com.adapt.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;

import javax.servlet.http.HttpServletRequest;

@Configuration
@EnableWebSecurity
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter{

	@Value("${BASICAUTH.USERNAME}")
	private String userName;
	@Value("${BASICAUTH.PASSWORD}")
	private String password;

	@Override
	protected void configure(HttpSecurity httpSecurity) throws Exception {
		httpSecurity.cors().configurationSource(new CorsConfigurationSource() {
			@Override
			public CorsConfiguration getCorsConfiguration(HttpServletRequest request) {
				return new CorsConfiguration().applyPermitDefaultValues();
			}
		}).and().csrf().disable().authorizeRequests()
				.antMatchers("/api/adapt/**").permitAll()
				.antMatchers("/actuator/**").permitAll()
				.anyRequest().authenticated().and()
				.formLogin()
				.permitAll()
				.and()
				.logout()
				.permitAll()
				.and()
				.headers()
				.xssProtection();;
	}

	@Bean
	@Override
	public UserDetailsService userDetailsService() {
		UserDetails user =
				User.withDefaultPasswordEncoder()
						.username(userName)
						.password(password)
						.roles("USER")
						.build();

		return new InMemoryUserDetailsManager(user);
	}

}
