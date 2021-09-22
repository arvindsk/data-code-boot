package com.adapt.repository;

import com.adapt.entity.SiteEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface SiteEntityRepository extends JpaRepository<SiteEntity, Integer>, JpaSpecificationExecutor<SiteEntity> {
    SiteEntity findByNaccId(Integer naccId);
}
