package com.adapt.repository;

import com.adapt.entity.ParticipantEmailEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;


public interface ParticipantEmailEntityRepository extends JpaRepository<ParticipantEmailEntity, Integer>, JpaSpecificationExecutor<ParticipantEmailEntity> {
    ParticipantEmailEntity findByParticipantId(Integer participantId);
}
