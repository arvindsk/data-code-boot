package com.adapt.repository;

import com.adapt.entity.ColumnsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface ColumnsEntityRepository extends JpaRepository<ColumnsEntity, Integer>, JpaSpecificationExecutor<ColumnsEntity> {

}
