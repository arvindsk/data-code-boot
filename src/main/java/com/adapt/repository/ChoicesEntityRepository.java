package com.adapt.repository;

import com.adapt.entity.ChoicesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface ChoicesEntityRepository extends JpaRepository<ChoicesEntity, Integer>, JpaSpecificationExecutor<ChoicesEntity> {

}
