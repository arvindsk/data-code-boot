package com.adapt.repository;

import com.adapt.entity.StudyEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface StudyEntityRepository extends JpaRepository<StudyEntity, String>, JpaSpecificationExecutor<StudyEntity> {

}
