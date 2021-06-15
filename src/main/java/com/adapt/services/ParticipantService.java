package com.adapt.services;

import com.adapt.dto.Participant;
import com.adapt.dto.ParticipantStudy;
import com.adapt.dto.enums.Study;
import com.adapt.entity.ParticipantStudyEntity;
import com.adapt.entity.ParticipantsEntity;
import com.adapt.entity.StudyEntity;
import com.adapt.repository.ParticipantStudyEntityRepository;
import com.adapt.repository.ParticipantsEntityRepository;
import com.adapt.repository.StudyEntityRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Service
public class ParticipantService {

    private final ParticipantsEntityRepository participantsEntityRepository;
    private final ParticipantStudyEntityRepository participantStudyEntityRepository;
    private final StudyEntityRepository studyEntityRepository;

    public ParticipantService(ParticipantsEntityRepository participantsEntityRepository,
                              ParticipantStudyEntityRepository participantStudyEntityRepository,
                              StudyEntityRepository studyEntityRepository) {
        this.participantsEntityRepository = participantsEntityRepository;
        this.participantStudyEntityRepository = participantStudyEntityRepository;
        this.studyEntityRepository = studyEntityRepository;
    }

    public List<Participant> getParticipants(String host) {
        List<Participant> participants = new ArrayList<>();
        List<ParticipantsEntity> participantsEntities = participantsEntityRepository.findAll();
        for (ParticipantsEntity participantsEntity : participantsEntities) {
            Participant participant = Participant.builder()
                    .participantId(participantsEntity.getParticipantId())
                    .firstName(participantsEntity.getFirstName())
                    .lastName(participantsEntity.getLastName())
                    .timeline("baseline")
                    .registeredDate(new Date())
                    .dob("09-04-1989")
                    .build();
       /*        List<ParticipantStudyEntity> participantStudyEntities = participantStudyEntityRepository.findByParticipantId(participantsEntity.getParticipantId());
         List<ParticipantStudy> participantStudies = new ArrayList<ParticipantStudy>();
            for (ParticipantStudyEntity participantStudyEntity : participantStudyEntities) {
                ParticipantStudy participantStudy = ParticipantStudy.builder().build();
                participantStudy.setTimeline(participantStudyEntity.getTimeline());
                StudyEntity studyEntity = studyEntityRepository.findByStudyId(participantStudyEntity.getStudyId());
                participantStudy.setStudyName(studyEntity.getStudyName());
                participantStudies.add(participantStudy);
                //TODO - to populate the last to column in the collect data screen
                //if(study completed)
                //participant.setTimeline(participantStudyEntity.getTimeline());
                //participant.setStudyCompleted(studyname);
                //
            }

 */
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
        participantStudyEntity.setStatus(participantStudy.getStatus());

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
        List<ParticipantStudyEntity> participantStudyEntityList = participantStudyEntityRepository.findByParticipantId(participantId);
        if(Objects.isNull(participantStudyEntityList) || participantStudyEntityList.isEmpty() ){
            participantStudyEntityList=createParticipantStudyEntitiesForParticipant(participantId,timeline);
            participantStudyEntityList = participantStudyEntityRepository.saveAllAndFlush(participantStudyEntityList);
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
                    .build();
            participantStudyList.add(participantStudy);
        }
        return participantStudyList;
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
