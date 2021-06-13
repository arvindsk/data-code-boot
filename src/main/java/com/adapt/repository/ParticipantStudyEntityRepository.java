package com.adapt.repository;

import com.adapt.entity.ParticipantStudyEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface ParticipantStudyEntityRepository extends JpaRepository<ParticipantStudyEntity, Integer>, JpaSpecificationExecutor<ParticipantStudyEntity> {
    List<ParticipantStudyEntity> findByStudyId(Integer studyId);
    List<ParticipantStudyEntity> findByPatientId(Integer patientId);
    ParticipantStudyEntity findParticipantStudyEntityByParticipantStudyId(Integer participantStudyId);
    ParticipantStudyEntity findParticipantStudyEntityByPatientIdAndAndStudyId(String patientId,Integer studyId);
}
