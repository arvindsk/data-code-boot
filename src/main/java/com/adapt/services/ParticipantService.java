package com.adapt.services;

import com.adapt.dto.Participant;
import com.adapt.dto.ParticipantStudy;
import com.adapt.entity.ParticipantStudyEntity;
import com.adapt.entity.ParticipantsEntity;
import com.adapt.repository.ParticipantStudyEntityRepository;
import com.adapt.repository.ParticipantsEntityRepository;
import com.adapt.repository.StudyEntityRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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

    public List<Participant> getParticipants(String host){
        List<Participant> participants = new ArrayList<Participant>();
        List<ParticipantsEntity> participantsEntities = participantsEntityRepository.findAll();
        for(ParticipantsEntity participantsEntity : participantsEntities){
            Participant participant = new Participant();
            participant.setId(participantsEntity.getId());
            List<ParticipantStudyEntity> participantStudyEntities = participantStudyEntityRepository.findByPatientId(participantsEntity.getId());
            List<ParticipantStudy> participantStudies = new ArrayList<ParticipantStudy>();
            for(ParticipantStudyEntity participantStudyEntity : participantStudyEntities){
                ParticipantStudy participantStudy = new ParticipantStudy();
                participantStudy.setTimeline(participantStudyEntity.getTimeline());
                String studyname = studyEntityRepository.findByStudyId(participantStudyEntity.getStudyId());
                participantStudy.setStudy(studyname);
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
}
