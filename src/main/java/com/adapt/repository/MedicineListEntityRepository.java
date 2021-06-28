package com.adapt.repository;

import com.adapt.entity.MedicineListEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface MedicineListEntityRepository extends JpaRepository<MedicineListEntity, Integer>, JpaSpecificationExecutor<MedicineListEntity> {

}
