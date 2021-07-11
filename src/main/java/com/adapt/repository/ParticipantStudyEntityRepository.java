package com.adapt.repository;

import com.adapt.entity.ParticipantStudyEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface ParticipantStudyEntityRepository extends JpaRepository<ParticipantStudyEntity, Integer>, JpaSpecificationExecutor<ParticipantStudyEntity> {
    List<ParticipantStudyEntity> findByStudyId(Integer studyId);

    List<ParticipantStudyEntity> findByParticipantId(Integer participantId);
    List<ParticipantStudyEntity> findByParticipantIdAndTimeline(Integer participantId,String timeline);
    List<ParticipantStudyEntity> findByStudyIdAndTimelineAndStatus(Integer studyId, String timeline, String status);
    List<ParticipantStudyEntity> findByParticipantIdOrderByCompletedTimeDesc(Integer participantId);
    List<ParticipantStudyEntity> findByParticipantIdAndCompletedTimeIsNotNullOrderByCompletedTime(Integer participantId);

    ParticipantStudyEntity findParticipantStudyEntityByParticipantStudyId(Integer participantStudyId);

    ParticipantStudyEntity findParticipantStudyEntityByParticipantIdAndStudyId(Integer participantId, Integer studyId);
    ParticipantStudyEntity findParticipantStudyEntityByParticipantIdAndStudyIdAndTimeline(Integer participantId, Integer studyId,String timeline);
    List<ParticipantStudyEntity> findByStudyIdAndTimeline(Integer studyId,String timeline);
}
