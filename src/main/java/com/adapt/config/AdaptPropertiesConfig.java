package com.adapt.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import java.util.List;

@Data
@Configuration
@ConfigurationProperties(prefix = "app")
@Component
public class AdaptPropertiesConfig {
    private List<String> corsOrigins;

}
