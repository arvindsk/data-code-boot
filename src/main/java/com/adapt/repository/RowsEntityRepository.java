package com.adapt.repository;

import com.adapt.entity.RowsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface RowsEntityRepository extends JpaRepository<RowsEntity, Integer>, JpaSpecificationExecutor<RowsEntity> {

}
