package com.adapt.repository;

import com.adapt.entity.CountEntity;
import com.adapt.entity.MedicineListEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface CountEntityRepository extends JpaRepository<CountEntity, Integer>, JpaSpecificationExecutor<CountEntity> {

}
