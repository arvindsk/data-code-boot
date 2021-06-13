package com.adapt.services;

import com.adapt.dto.Participant;
import com.adapt.dto.ParticipantStudy;
import com.adapt.entity.ParticipantStudyEntity;
import com.adapt.entity.ParticipantsEntity;
import com.adapt.entity.StudyEntity;
import com.adapt.repository.ParticipantStudyEntityRepository;
import com.adapt.repository.ParticipantsEntityRepository;
import com.adapt.repository.StudyEntityRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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
        List<Participant> participants = new ArrayList<Participant>();
        List<ParticipantsEntity> participantsEntities = participantsEntityRepository.findAll();
        for (ParticipantsEntity participantsEntity : participantsEntities) {
            Participant participant = new Participant();
            participant.setId(participantsEntity.getId());
            List<ParticipantStudyEntity> participantStudyEntities = participantStudyEntityRepository.findByPatientId(participantsEntity.getId());
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


            participants.add(participant);
        }
        return participants;
    }

    public void saveQuestionnaireFilled(ParticipantStudy participantStudy) {
        ParticipantStudyEntity participantStudyEntity = participantStudyEntityRepository.findParticipantStudyEntityByPatientIdAndAndStudyId(
                participantStudy.getPatientId(), participantStudy.getStudyId());
        if (Objects.isNull(participantStudyEntity)) {
            participantStudyEntity = new ParticipantStudyEntity();
            participantStudyEntity.setPatientId(participantStudy.getPatientId());
            participantStudyEntity.setStudyId(participantStudy.getStudyId());
            participantStudyEntity.setTimeline(participantStudy.getTimeline());
        }
        participantStudyEntity.setStudyInformation(participantStudy.getStudyInformation());
        participantStudyEntity.setStatus(participantStudy.getStatus());

        participantStudyEntityRepository.saveAndFlush(participantStudyEntity);
    }

    public ParticipantStudy getQuestionnaireFilled(ParticipantStudy participantStudy) {
        ParticipantStudyEntity participantStudyEntity = participantStudyEntityRepository.findParticipantStudyEntityByPatientIdAndAndStudyId(
                participantStudy.getPatientId(), participantStudy.getStudyId());

        if(Objects.nonNull(participantStudyEntity)){
           return ParticipantStudy.builder().studyInformation(participantStudyEntity.getStudyInformation()).build();
        }
        return null;
    }
}
