package com.adapt.services;

import com.adapt.dto.SummaryResponse;
import com.adapt.entity.ParticipantsEntity;
import com.adapt.entity.StudyEntity;
import com.adapt.repository.ParticipantStudyEntityRepository;
import com.adapt.repository.ParticipantsEntityRepository;
import com.adapt.repository.StudyEntityRepository;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SummaryService {

    private final ParticipantsEntityRepository participantsEntityRepository;
    private final StudyEntityRepository studyEntityRepository;
    private final ParticipantStudyEntityRepository participantStudyEntityRepository;

    public SummaryService(ParticipantsEntityRepository participantsEntityRepository,
                          StudyEntityRepository studyEntityRepository,
                          ParticipantStudyEntityRepository participantStudyEntityRepository) {
        this.participantsEntityRepository = participantsEntityRepository;
        this.studyEntityRepository = studyEntityRepository;
        this.participantStudyEntityRepository = participantStudyEntityRepository;
    }

    public SummaryResponse summary(String host){
        SummaryResponse response = new SummaryResponse();
        Long participantCount = participantsEntityRepository.count();
        response.setParticipantCount(participantCount);
        Map<String, Long> studyCountMap = new HashMap<String, Long>();
        List<StudyEntity> studies = studyEntityRepository.findAll();
        for(StudyEntity study : studies){
            String studyName = study.getStudyName();
            Long studyCount = Long.valueOf(participantStudyEntityRepository.findByStudyId(study.getStudyId()).size());
            studyCountMap.put(studyName, studyCount);
        }
        response.setStudySummary(studyCountMap);
        return response;
    }
}
