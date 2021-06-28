package com.adapt.repository;

import com.adapt.entity.CerealListEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface CerealListEntityRepository extends JpaRepository<CerealListEntity, Integer>, JpaSpecificationExecutor<CerealListEntity> {

}
