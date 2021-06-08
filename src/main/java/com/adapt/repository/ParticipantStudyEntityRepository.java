package com.adapt.repository;

import com.adapt.entity.ParticipantStudyEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface ParticipantStudyEntityRepository extends JpaRepository<ParticipantStudyEntity, String>, JpaSpecificationExecutor<ParticipantStudyEntity> {

}
