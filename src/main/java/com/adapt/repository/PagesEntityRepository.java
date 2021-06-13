package com.adapt.repository;

import com.adapt.entity.PagesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface PagesEntityRepository extends JpaRepository<PagesEntity, Integer>, JpaSpecificationExecutor<PagesEntity> {

}
