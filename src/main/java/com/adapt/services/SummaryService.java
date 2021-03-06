package com.adapt.services;

import com.adapt.dto.Participant;
import com.adapt.dto.Summary;
import com.adapt.dto.SummaryMap;
import com.adapt.dto.enums.Status;
import com.adapt.dto.enums.Timeline;
import com.adapt.entity.ParticipantsEntity;
import com.adapt.entity.StudyEntity;
import com.adapt.repository.ParticipantStudyEntityRepository;
import com.adapt.repository.ParticipantsEntityRepository;
import com.adapt.repository.StudyEntityRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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

    public Summary summary(String host){
        Summary response = new Summary();
        //Long participantCount = participantsEntityRepository.count();
        List<ParticipantsEntity> participantList = participantsEntityRepository.findAllByNaccID(host);
        List<Integer> participantIds = new ArrayList<Integer>();
        for(ParticipantsEntity entity : participantList){
            participantIds.add(entity.getParticipantId());
        }
        response.setParticipantCount(participantList.size());
        List<SummaryMap> studyCountBaselineMap = new ArrayList<SummaryMap>();
        List<SummaryMap> studyCountFirstYearMap = new ArrayList<SummaryMap>();
        List<SummaryMap> studyCountThirdYearMap = new ArrayList<SummaryMap>();
        List<StudyEntity> studies = studyEntityRepository.findAll();
        for(StudyEntity study : studies){
            String studyName = study.getStudyName();
            Long baselineStudyCount = Long.valueOf(
                    participantStudyEntityRepository.findByStudyIdAndTimelineAndStatusAndParticipantIdIn(
                            study.getStudyId(),
                            Timeline.BASELINE.getTimelineName(),
                            Status.SUBMITTED.getStatusName(),
                            participantIds)
                            .size());
            SummaryMap baselineMap = new SummaryMap(studyName, baselineStudyCount);
            studyCountBaselineMap.add(baselineMap);
            Long firstyearStudyCount = Long.valueOf(
                    participantStudyEntityRepository.findByStudyIdAndTimelineAndStatusAndParticipantIdIn(
                            study.getStudyId(),
                            Timeline.FIRST_YEAR.getTimelineName(),
                            Status.SUBMITTED.getStatusName(),
                            participantIds)
                            .size());
            SummaryMap firstyearMap = new SummaryMap(studyName, firstyearStudyCount);
            studyCountFirstYearMap.add(firstyearMap);
            Long thirdyearStudyCount = Long.valueOf(
                    participantStudyEntityRepository.findByStudyIdAndTimelineAndStatusAndParticipantIdIn(
                            study.getStudyId(),
                            Timeline.THIRD_YEAR.getTimelineName(),
                            Status.SUBMITTED.getStatusName(),
                            participantIds)
                            .size());
            SummaryMap thirdyearMap = new SummaryMap(studyName, thirdyearStudyCount);
            studyCountThirdYearMap.add(thirdyearMap);
        }
        response.setBaselineStudySummary(studyCountBaselineMap);
        response.setFirstyearStudySummary(studyCountFirstYearMap);
        response.setThirdyearStudySummary(studyCountThirdYearMap);
        return response;
    }
}
