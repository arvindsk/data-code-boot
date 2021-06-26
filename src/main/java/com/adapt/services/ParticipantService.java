package com.adapt.services;

import com.adapt.dto.Participant;
import com.adapt.dto.ParticipantStudy;
import com.adapt.dto.enums.Status;
import com.adapt.dto.enums.Study;
import com.adapt.dto.enums.Timeline;
import com.adapt.entity.ParticipantStudyEntity;
import com.adapt.entity.ParticipantsEntity;
import com.adapt.repository.ParticipantStudyEntityRepository;
import com.adapt.repository.ParticipantsEntityRepository;
import com.adapt.repository.StudyEntityRepository;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ParticipantService {

    private final ParticipantsEntityRepository participantsEntityRepository;
    private final ParticipantStudyEntityRepository participantStudyEntityRepository;

    public ParticipantService(ParticipantsEntityRepository participantsEntityRepository,
                              ParticipantStudyEntityRepository participantStudyEntityRepository) {
        this.participantsEntityRepository = participantsEntityRepository;
        this.participantStudyEntityRepository = participantStudyEntityRepository;
    }

    public List<Participant> getParticipants(String host) {
        List<Participant> participants = new ArrayList<>();
        List<ParticipantsEntity> participantsEntities = participantsEntityRepository.findAll();
        for (ParticipantsEntity participantsEntity : participantsEntities) {
            List<ParticipantStudyEntity> participantStudyList = participantStudyEntityRepository.
                    findByParticipantIdOrderByCompletedTimeDesc(participantsEntity.getParticipantId());

            Participant participant = Participant.builder()
                    .participantId(participantsEntity.getParticipantId())
                    .firstName(participantsEntity.getFirstName())
                    .lastName(participantsEntity.getLastName())
                    .timeline(participantStudyList.size()>0?participantStudyList.get(0).getTimeline():"baseline")
                    .registeredDate(participantsEntity.getAutotime())
                    .dob(participantsEntity.getDob())
                    .completedDate(participantStudyList.size()>0?participantStudyList.get(0).getCompletedTime():null)
                    .build();

            participants.add(participant);
     }
        return participants;
    }

    public void saveQuestionnaireFilled(ParticipantStudy participantStudy) {
        ParticipantStudyEntity participantStudyEntity = participantStudyEntityRepository.findParticipantStudyEntityByParticipantIdAndStudyIdAndTimeline(
                participantStudy.getParticipantId(), participantStudy.getStudyId(),participantStudy.getTimeline());
        if (Objects.isNull(participantStudyEntity)) {
            participantStudyEntity = new ParticipantStudyEntity();
            participantStudyEntity.setParticipantId(participantStudy.getParticipantId());
            participantStudyEntity.setStudyId(participantStudy.getStudyId());
            participantStudyEntity.setTimeline(participantStudy.getTimeline());
        }
        participantStudyEntity.setStudyInformation(participantStudy.getStudyInformation());
        if("completed".equalsIgnoreCase(participantStudy.getStatus())){
            participantStudyEntity.setStatus(Status.COMPLETED.getStatusName());
            participantStudyEntity.setCompletedTime(new Date());
        }else if("running".equalsIgnoreCase(participantStudy.getStatus())){
            participantStudyEntity.setStatus(Status.IN_PROGRESS.getStatusName());
        }

        participantStudyEntityRepository.saveAndFlush(participantStudyEntity);
    }

    public ParticipantStudy getQuestionnaireFilled(ParticipantStudy participantStudy) {
        ParticipantStudyEntity participantStudyEntity = participantStudyEntityRepository.findParticipantStudyEntityByParticipantIdAndStudyIdAndTimeline(
                participantStudy.getParticipantId(), participantStudy.getStudyId(),participantStudy.getTimeline());

        if(Objects.nonNull(participantStudyEntity)){
           return ParticipantStudy.builder().studyInformation(participantStudyEntity.getStudyInformation()).build();
        }
        return null;
    }

    public List<ParticipantStudy> getParticipantStudyList(Participant participant) {
        List<ParticipantStudy> participantStudyList=new ArrayList<>();
        Integer participantId = participant.getParticipantId();
        String timeline = participant.getTimeline();
        String activeTimeline = Timeline.BASELINE.getTimelineName();

        List<ParticipantStudyEntity> participantStudyEntityList = participantStudyEntityRepository.findByParticipantIdAndTimeline(participantId,timeline);
        if(Objects.isNull(participantStudyEntityList) || participantStudyEntityList.isEmpty() ){
            participantStudyEntityList=createParticipantStudyEntitiesForParticipant(participantId,timeline);
            participantStudyEntityList = participantStudyEntityRepository.saveAllAndFlush(participantStudyEntityList);
        }else{
            Date firstAttemptTime = participantStudyEntityList.get(0).getCompletedTime();
            if(firstAttemptTime!=null) {
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(firstAttemptTime);
                Calendar calendar1 = Calendar.getInstance();
                calendar.add(Calendar.MONTH, 9);
                if (calendar1.after(calendar)) {
                    activeTimeline = Timeline.FIRST_YEAR.getTimelineName();
                    calendar.add(Calendar.MONTH, 24);
                    if (calendar1.after(calendar)) {
                        activeTimeline = Timeline.THIRD_YEAR.getTimelineName();
                    }
                }
            }
        }
        for (ParticipantStudyEntity entity:participantStudyEntityList){
            ParticipantStudy participantStudy = ParticipantStudy.builder().studyId(entity.getStudyId())
                    .participantStudyId(entity.getParticipantStudyId())
                    .studyInformation(entity.getStudyInformation())
                    .studyName(Study.getStudyNameForKey(entity.getStudyId()))
                    .status(entity.getStatus())
                    .timeline(entity.getTimeline())
                    .completedDate(entity.getCompletedTime())
                    .participantId(entity.getParticipantId())
                    .activeTimeline(activeTimeline)
                    .firstName(getFirstName(participantId))
                    .build();
            participantStudyList.add(participantStudy);
        }
        return participantStudyList;
    }

    private String getFirstName(Integer participantId) {
        if(Objects.nonNull(participantId)){
            ParticipantsEntity participantsEntity=participantsEntityRepository.getById(participantId);
            return participantsEntity.getFirstName();
        }
        return null;
    }

    /*
    1001	Vascular Risk
    1002	Cardio Vascular Risk
    1003	Memory
    1004	Diet
    1005	Excercise
     */
    private List<ParticipantStudyEntity> createParticipantStudyEntitiesForParticipant(Integer participantId,String timeline) {
        List<ParticipantStudyEntity> participantStudyEntityList=new ArrayList<>();
        ParticipantStudyEntity vascularStudy=ParticipantStudyEntity.builder()
                .studyId(Study.VASCULAR_RISK.getStudyId())
                .status("Not Started")
                .timeline(timeline)
                .participantId(participantId)
                .build();
        ParticipantStudyEntity cardioVascular=ParticipantStudyEntity.builder()
                .studyId(Study.CARDIO_VASCULAR_RISK.getStudyId())
                .status("Not Started")
                .timeline(timeline)
                .participantId(participantId)
                .build();
        ParticipantStudyEntity memoryStudy=ParticipantStudyEntity.builder()
                .studyId(Study.MEMORY.getStudyId())
                .status("Not Started")
                .timeline(timeline)
                .participantId(participantId)
                .build();
        ParticipantStudyEntity dietStudy=ParticipantStudyEntity.builder()
                .studyId(Study.DIET.getStudyId())
                .status("Not Started")
                .timeline(timeline)
                .participantId(participantId)
                .build();

        ParticipantStudyEntity exerciseStudy=ParticipantStudyEntity.builder()
                .studyId(Study.EXERCISE.getStudyId())
                .status("Not Started")
                .timeline(timeline)
                .participantId(participantId)
                .build();

        participantStudyEntityList.add(vascularStudy);
        participantStudyEntityList.add(cardioVascular);
        participantStudyEntityList.add(memoryStudy);
        participantStudyEntityList.add(dietStudy);
        participantStudyEntityList.add(exerciseStudy);
        return participantStudyEntityList;
    }
}
