package com.adapt.repository;

import com.adapt.entity.ElementsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface ElementsEntityRepository extends JpaRepository<ElementsEntity, Integer>, JpaSpecificationExecutor<ElementsEntity> {

}
