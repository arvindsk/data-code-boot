package com.adapt.repository;

import com.adapt.entity.WebusersEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface WebusersEntityRepository extends JpaRepository<WebusersEntity, String>, JpaSpecificationExecutor<WebusersEntity> {


}
