package com.adapt.services;

import com.adapt.dto.Participant;
import com.adapt.dto.ParticipantStudy;
import com.adapt.dto.UpdateStatus;
import com.adapt.dto.enums.*;
import com.adapt.entity.*;
import com.adapt.repository.*;
import com.google.common.base.Strings;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.mail.javamail.JavaMailSender;

import java.util.*;
import java.util.stream.Collectors;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@Service
public class ParticipantService {

    @Value("${mail.userName}")
    private String userName;
    @Value("${app.redirect-url}")
    private String url;

    private final ParticipantsEntityRepository participantsEntityRepository;
    private final ParticipantStudyEntityRepository participantStudyEntityRepository;
    private final CerealListEntityRepository cerealListEntityRepository;
    private final MedicineListEntityRepository medicineListEntityRepository;
    private final ParticipantEmailEntityRepository participantEmailEntityRepository;
    private final StudyEntityRepository studyEntityRepository;
    private JavaMailSender emailSender;

    public ParticipantService(ParticipantsEntityRepository participantsEntityRepository,
                              ParticipantStudyEntityRepository participantStudyEntityRepository,
                              CerealListEntityRepository cerealListEntityRepository,
                              MedicineListEntityRepository medicineListEntityRepository,
                              ParticipantEmailEntityRepository participantEmailEntityRepository,
                              StudyEntityRepository studyEntityRepository,
                              JavaMailSender emailSender) {
        this.participantsEntityRepository = participantsEntityRepository;
        this.participantStudyEntityRepository = participantStudyEntityRepository;
        this.cerealListEntityRepository = cerealListEntityRepository;
        this.medicineListEntityRepository = medicineListEntityRepository;
        this.participantEmailEntityRepository = participantEmailEntityRepository;
        this.studyEntityRepository = studyEntityRepository;
        this.emailSender = emailSender;
    }

    public List<Participant> getParticipants(String host) {
        List<Participant> participants = new ArrayList<>();
        List<ParticipantsEntity> participantsEntities = participantsEntityRepository.findAllByNaccID(host);
        for (ParticipantsEntity participantsEntity : participantsEntities) {
            List<ParticipantStudyEntity> participantStudyList = participantStudyEntityRepository.
                    findByParticipantIdOrderByCompletedTimeDesc(participantsEntity.getParticipantId());

            String baselineStatus = null;
            String firstyearStatus = null;
            String thirdyearStatus = null;

            for(ParticipantStudyEntity participantStudy : participantStudyList){
                if("Baseline".equalsIgnoreCase(participantStudy.getTimeline())){

                    if(participantStudy.getCompletedTime()!=null){
                        if(baselineStatus==null) {
                            baselineStatus = Status.COMPLETED.getStatusName();
                        }else if(Status.NOT_STARTED.getStatusName().equalsIgnoreCase(baselineStatus)){
                            baselineStatus = Status.IN_PROGRESS.getStatusName();
                        }
                    }else{
                        if(participantStudy.getStudyInformation()!=null){
                            baselineStatus = Status.IN_PROGRESS.getStatusName();
                        }
                        if(baselineStatus==null || Status.NOT_STARTED.getStatusName().equalsIgnoreCase(baselineStatus)) {
                            baselineStatus = Status.NOT_STARTED.getStatusName();
                        }else{
                            baselineStatus = Status.IN_PROGRESS.getStatusName();
                        }
                    }
                }
                if("Firstyear".equalsIgnoreCase(participantStudy.getTimeline())){

                    if(participantStudy.getCompletedTime()!=null){
                        if(firstyearStatus==null) {
                            firstyearStatus = Status.COMPLETED.getStatusName();
                        }else if(Status.NOT_STARTED.getStatusName().equalsIgnoreCase(firstyearStatus)){
                            firstyearStatus = Status.IN_PROGRESS.getStatusName();
                        }
                    }else{
                        if(participantStudy.getStudyInformation()!=null){
                            firstyearStatus = Status.IN_PROGRESS.getStatusName();
                        }
                        if(firstyearStatus==null || Status.NOT_STARTED.getStatusName().equalsIgnoreCase(firstyearStatus)) {
                            firstyearStatus = Status.NOT_STARTED.getStatusName();
                        }else{
                            firstyearStatus = Status.IN_PROGRESS.getStatusName();
                        }
                    }
                }
                if("Thirdyear".equalsIgnoreCase(participantStudy.getTimeline())){

                    if(participantStudy.getCompletedTime()!=null){
                        if(thirdyearStatus==null) {
                            thirdyearStatus = Status.COMPLETED.getStatusName();
                        }else if(Status.NOT_STARTED.getStatusName().equalsIgnoreCase(thirdyearStatus)){
                            thirdyearStatus = Status.IN_PROGRESS.getStatusName();
                        }
                    }else{
                        if(participantStudy.getStudyInformation()!=null){
                            thirdyearStatus = Status.IN_PROGRESS.getStatusName();
                        }
                        if(thirdyearStatus==null || Status.NOT_STARTED.getStatusName().equalsIgnoreCase(thirdyearStatus)) {
                            thirdyearStatus = Status.NOT_STARTED.getStatusName();
                        }else{
                            thirdyearStatus = Status.IN_PROGRESS.getStatusName();
                        }
                    }
                }

            }
            List<ParticipantStudyEntity> participantStudyTimelineList = participantStudyEntityRepository
                    .findByParticipantIdAndCompletedTimeIsNotNullOrderByCompletedTime(participantsEntity.getParticipantId());
            if(participantStudyTimelineList.isEmpty()){
                participantStudyTimelineList = participantStudyEntityRepository
                        .findByParticipantId(participantsEntity.getParticipantId());
            }
            if(!participantStudyTimelineList.isEmpty()) {
                Date firstAttemptTime = participantStudyTimelineList.get(0).getCompletedTime();
                if (firstAttemptTime != null) {
                    Calendar calendar = Calendar.getInstance();
                    calendar.setTime(firstAttemptTime);
                    calendar.add(Calendar.MONTH, 12);
                    Calendar calendar2 = Calendar.getInstance();
                    calendar2.setTime(firstAttemptTime);
                    calendar2.add(Calendar.MONTH, 24);
                    Calendar calendar1 = Calendar.getInstance();

                    if (calendar1.after(calendar)) {
                        //activeTimeline = Timeline.FIRST_YEAR.getTimelineName();
                            if (Status.IN_PROGRESS.getStatusName().equalsIgnoreCase(baselineStatus)) {
                                baselineStatus = Status.IN_COMPLETE.getStatusName();
                        }
                        calendar.add(Calendar.MONTH, 18);
                        calendar2.add(Calendar.MONTH, 18);
                        if (calendar1.after(calendar)) {
                            //activeTimeline = Timeline.THIRD_YEAR.getTimelineName();
                            if (Status.IN_PROGRESS.getStatusName().equalsIgnoreCase(firstyearStatus)) {
                                firstyearStatus = Status.IN_COMPLETE.getStatusName();
                            }
                            if (calendar1.after(calendar2)) {
                                if (Status.IN_PROGRESS.getStatusName().equalsIgnoreCase(thirdyearStatus)) {
                                    thirdyearStatus = Status.IN_COMPLETE.getStatusName();
                                }
                            }
                        }
                    }
                }
            }
            ParticipantEmailEntity emailEntity = participantEmailEntityRepository.findByParticipantId(participantsEntity.getParticipantId());
            String email = Objects.nonNull(emailEntity)?emailEntity.getEmail() != null ? emailEntity.getEmail() : "":null;
            Participant participant = Participant.builder()
                    .participantId(participantsEntity.getParticipantId())
                    .firstName(participantsEntity.getFirstName())
                    .lastName(participantsEntity.getLastName())
                    .timeline(participantStudyList.size() > 0 ? participantStudyList.get(0).getTimeline() : "Baseline")
                    .registeredDate(participantsEntity.getAutotime())
                    .dob(participantsEntity.getDob()!=null && !"".equalsIgnoreCase(participantsEntity.getDob())?participantsEntity.getDob().substring(0,5):"")
                    .baselineStatus(baselineStatus!=null?baselineStatus:Status.NOT_STARTED.getStatusName())
                    .firstyearStatus(firstyearStatus!=null?firstyearStatus:Status.NOT_STARTED.getStatusName())
                    .thirdyearStatus(thirdyearStatus!=null?thirdyearStatus:Status.NOT_STARTED.getStatusName())
                    .email(email)
                    //.completedDate(participantStudyList.size() > 0 ? participantStudyList.get(0).getCompletedTime() : null)
                    .build();

            /*switch(timeline){
                case "Baseline":
                    if(timeline.equalsIgnoreCase(participant.getTimeline())){
                        participants.add(participant);
                    }
                    break;
                case "Firstyear":
                    if(timeline.equalsIgnoreCase(participant.getTimeline()) || "Baseline".equalsIgnoreCase(participant.getTimeline())){
                        participants.add(participant);
                    }
                    break;
                case "Thirdyear":
                    if(timeline.equalsIgnoreCase(participant.getTimeline()) || "Baseline".equalsIgnoreCase(participant.getTimeline()) || "Firstyear".equalsIgnoreCase(participant.getTimeline())){
                        participants.add(participant);
                    }
                    break;
            }*/
            participants.add(participant);

        }
        return participants;
    }

    public void saveQuestionnaireFilled(ParticipantStudy participantStudy) {
        ParticipantStudyEntity participantStudyEntity = participantStudyEntityRepository.findParticipantStudyEntityByParticipantIdAndStudyIdAndTimeline(
                participantStudy.getParticipantId(), participantStudy.getStudyId(), participantStudy.getTimeline());
        if (Objects.isNull(participantStudyEntity)) {
            participantStudyEntity = new ParticipantStudyEntity();
            participantStudyEntity.setParticipantId(participantStudy.getParticipantId());
            participantStudyEntity.setStudyId(participantStudy.getStudyId());
            participantStudyEntity.setTimeline(participantStudy.getTimeline());
           // participantStudyEntity.setQuid(generateGUID());
        }
        participantStudyEntity.setStudyInformation(participantStudy.getStudyInformation());
        participantStudyEntity.setAccess(participantStudy.getAccess());
        if ((Access.ONSITE_PARTICIPANT.getAccessValue().equalsIgnoreCase(participantStudy.getAccess())
                || Access.EMAIL_PARTICIPANT.getAccessValue().equalsIgnoreCase(participantStudy.getAccess()))
                && "completed".equalsIgnoreCase(participantStudy.getStatus())) {
            participantStudyEntity.setStatus(Status.READY_FOR_SUBMISSION.getStatusName());
            //participantStudyEntity.setQuid(generateGUID());
        } else if ("completed".equalsIgnoreCase(participantStudy.getStatus())) {
            participantStudyEntity.setStatus(Status.SUBMITTED.getStatusName());
            participantStudyEntity.setCompletedTime(new Date());
        } else if ("running".equalsIgnoreCase(participantStudy.getStatus())) {
            participantStudyEntity.setStatus(Status.IN_PROGRESS.getStatusName());
        }

        participantStudyEntityRepository.saveAndFlush(participantStudyEntity);
    }

    public ParticipantStudy getQuestionnaireFilled(ParticipantStudy participantStudy) {
        ParticipantStudyEntity participantStudyEntity = participantStudyEntityRepository.findParticipantStudyEntityByParticipantIdAndStudyIdAndTimeline(
                participantStudy.getParticipantId(), participantStudy.getStudyId(), participantStudy.getTimeline());

        if (Objects.nonNull(participantStudyEntity)) {
            return ParticipantStudy.builder().studyInformation(participantStudyEntity.getStudyInformation()).build();
        }
        return null;
    }

    public List<ParticipantStudy> getParticipantStudyList(Participant participant) {
        List<ParticipantStudy> participantStudyList = new ArrayList<>();
        Integer participantId = participant.getParticipantId();
        String timeline = participant.getTimeline();
        String activeTimeline = Timeline.BASELINE.getTimelineName();
        boolean isTimelineEnded = false;

        List<ParticipantStudyEntity> participantStudyEntityList = participantStudyEntityRepository.findByParticipantIdAndTimeline(participantId, timeline);
        if (Objects.isNull(participantStudyEntityList) || participantStudyEntityList.isEmpty()) {
            participantStudyEntityList = createParticipantStudyEntitiesForParticipant(participantId, timeline);
            participantStudyEntityList = participantStudyEntityRepository.saveAllAndFlush(participantStudyEntityList);
        } else {
            List<ParticipantStudyEntity> participantStudyTimelineList = participantStudyEntityRepository
                    .findByParticipantIdAndCompletedTimeIsNotNullOrderByCompletedTime(participantId);
            if(participantStudyTimelineList.isEmpty()){
                participantStudyTimelineList = participantStudyEntityRepository
                        .findByParticipantId(participantId);
            }
            Date firstAttemptTime = participantStudyTimelineList.get(0).getCompletedTime();
            if (firstAttemptTime != null) {
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(firstAttemptTime);
                calendar.add(Calendar.MONTH, 12);
                Calendar calendar2 = Calendar.getInstance();
                calendar2.setTime(firstAttemptTime);
                calendar2.add(Calendar.MONTH, 24);
                Calendar calendar1 = Calendar.getInstance();

                if (calendar1.after(calendar)) {
                    activeTimeline = Timeline.FIRST_YEAR.getTimelineName();
                    if(calendar1.after(calendar2)){
                        isTimelineEnded = true;
                    }
                    calendar.add(Calendar.MONTH, 18);
                    calendar2.add(Calendar.MONTH, 18);
                    if (calendar1.after(calendar)) {
                        isTimelineEnded = false;
                        activeTimeline = Timeline.THIRD_YEAR.getTimelineName();
                        if(calendar1.after(calendar2)){
                            isTimelineEnded = true;
                        }
                    }
                }
            }
        }
        String email=null;

        ParticipantEmailEntity emailEntity = participantEmailEntityRepository.findByParticipantId(participant.getParticipantId());


        if (Objects.nonNull(emailEntity)) {
            email=emailEntity.getEmail();
        }
        for (ParticipantStudyEntity entity : participantStudyEntityList) {
            ParticipantStudy participantStudy = ParticipantStudy.builder().studyId(entity.getStudyId())
                    .participantStudyId(entity.getParticipantStudyId())
                    .studyInformation(entity.getStudyInformation())
                    .studyName(Study.getStudyNameForKey(entity.getStudyId()))
                    .status(entity.getStatus())
                    .timeline(entity.getTimeline())
                    .participantId(entity.getParticipantId())
                    .activeTimeline(activeTimeline)
                    .endedTimeline(isTimelineEnded)
                    .firstName(getFirstName(participantId))
                    .access(entity.getAccess())
                    .email(email)
                    .quid(entity.getQuid())
                    .build();
            if(entity.getCompletedTime()!=null) {
                participantStudy.setCompletedDate(entity.getCompletedTime());
            }
            participantStudyList.add(participantStudy);
        }
        return participantStudyList;
    }

    public ParticipantStudy getParticipantStudy(String quid){
        ParticipantStudyEntity entity = participantStudyEntityRepository.findByQuid(quid);
        Integer participantId=entity.getParticipantId();
        String activeTimeline = Timeline.BASELINE.getTimelineName();
        boolean isTimelineEnded = false;

        List<ParticipantStudyEntity> participantStudyTimelineList = participantStudyEntityRepository
                .findByParticipantIdAndCompletedTimeIsNotNullOrderByCompletedTime(participantId);
        if(participantStudyTimelineList.isEmpty()){
            participantStudyTimelineList = participantStudyEntityRepository
                    .findByParticipantId(participantId);
        }
        Date firstAttemptTime = participantStudyTimelineList.get(0).getCompletedTime();
        if (firstAttemptTime != null) {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(firstAttemptTime);
            calendar.add(Calendar.MONTH, 12);
            Calendar calendar2 = Calendar.getInstance();
            calendar2.setTime(firstAttemptTime);
            calendar2.add(Calendar.MONTH, 24);
            Calendar calendar1 = Calendar.getInstance();

            if (calendar1.after(calendar)) {
                activeTimeline = Timeline.FIRST_YEAR.getTimelineName();
                if(calendar1.after(calendar2)){
                    isTimelineEnded = true;
                }
                calendar.add(Calendar.MONTH, 18);
                calendar2.add(Calendar.MONTH, 18);
                if (calendar1.after(calendar)) {
                    isTimelineEnded = false;
                    activeTimeline = Timeline.THIRD_YEAR.getTimelineName();
                    if(calendar1.after(calendar2)){
                        isTimelineEnded = true;
                    }
                }
            }
        }
        return ParticipantStudy.builder().studyId(entity.getStudyId())
                .participantStudyId(entity.getParticipantStudyId())
                .studyInformation(entity.getStudyInformation())
                .studyName(Study.getStudyNameForKey(entity.getStudyId()))
                .status(entity.getStatus())
                .timeline(entity.getTimeline())
                .participantId(entity.getParticipantId())
                .activeTimeline(activeTimeline)
                .endedTimeline(isTimelineEnded)
                .firstName(getFirstName(entity.getParticipantId()))
                .access(entity.getAccess())
                .quid(entity.getQuid())
                .build();
    }

    public boolean generateEmail(String email, String userName, String lastName, String url, String questionaire){

        try {

            // Create a default MimeMessage object.
            MimeMessage message = emailSender.createMimeMessage();

            // Set From: header field of the header.
            message.setFrom(userName);

            // Set To: header field of the header.
            message.setRecipients(Message.RecipientType.TO, email);

            // Set Subject: header field
            message.setSubject("DVCID Sleep questionnaire");

            // Now set the actual message
            String html = "<p>Dear Mr/Mrs. "+lastName+"</p><p>&nbsp;</p><p>Welcome to <b>DVCID <u>"+questionaire+" Study</u></b>.</p><p>&nbsp;</p><p>Please take a few moments to complete the questionnaire and submit it online.</p><p>Call us if you need any further information or assistance for completing the questionnaire.</p><p>&nbsp;</p><p><<<a href='"+url+"'>Click here for the questionnaire</a>>></p><p>&nbsp;</p><p>Note: <u>Please <b>do not reply to this email</b>, We would not receive your response. Kindly contact the study coordinator for any concerns.</u></p><p>&nbsp;</p><p>Thank you for your participation.</p><p><b>DVCID Team</b></p>";
            message.setText(html, "UTF-8", "html");

            // Send message
            emailSender.send(message);
            System.out.println("Sent message successfully....");
        } catch (MessagingException mex) {
            mex.printStackTrace();
            return false;
        }


        return true;
    }

    public List<String> getDrugsList() {
        List<MedicineListEntity> medicineListEntityList = this.medicineListEntityRepository.findAll();

        return medicineListEntityList.stream().map(MedicineListEntity::getName).collect(Collectors.toList());

    }

    public List<String> getCerealList() {
        List<CerealListEntity> cerealListEntityList = this.cerealListEntityRepository.findAll();

        return cerealListEntityList.stream().map(CerealListEntity::getName).collect(Collectors.toList());
    }

    private String getFirstName(Integer participantId) {
        if (Objects.nonNull(participantId)) {
            ParticipantsEntity participantsEntity = participantsEntityRepository.getById(participantId);
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
    private List<ParticipantStudyEntity> createParticipantStudyEntitiesForParticipant(Integer participantId, String timeline) {
        List<ParticipantStudyEntity> participantStudyEntityList = new ArrayList<>();
        ParticipantStudyEntity vascularStudy = ParticipantStudyEntity.builder()
                .studyId(Study.VASCULAR_RISK.getStudyId())
                .access(Access.ONSITE_COORDINATOR.getAccessValue())
                .status("Not Started")
                .timeline(timeline)
                .participantId(participantId)
                .quid(generateGUID())
                .build();
        ParticipantStudyEntity cardioVascular = ParticipantStudyEntity.builder()
                .studyId(Study.CARDIO_VASCULAR_RISK.getStudyId())
                .access(Access.ONSITE_COORDINATOR.getAccessValue())
                .status("Not Started")
                .timeline(timeline)
                .participantId(participantId)
                .quid(generateGUID())
                .build();
        ParticipantStudyEntity memoryStudy = ParticipantStudyEntity.builder()
                .studyId(Study.MEMORY.getStudyId())
                .access(Access.ONSITE_COORDINATOR.getAccessValue())
                .status("Not Started")
                .timeline(timeline)
                .participantId(participantId)
                .quid(generateGUID())
                .build();
        ParticipantStudyEntity dietStudy = ParticipantStudyEntity.builder()
                .studyId(Study.DIET.getStudyId())
                .access(Access.ONSITE_COORDINATOR.getAccessValue())
                .status("Not Started")
                .timeline(timeline)
                .participantId(participantId)
                .quid(generateGUID())
                .build();
        ParticipantStudyEntity exerciseStudy = ParticipantStudyEntity.builder()
                .studyId(Study.EXERCISE.getStudyId())
                .access(Access.ONSITE_COORDINATOR.getAccessValue())
                .status("Not Started")
                .timeline(timeline)
                .participantId(participantId)
                .quid(generateGUID())
                .build();

        participantStudyEntityList.add(vascularStudy);
        participantStudyEntityList.add(cardioVascular);
        participantStudyEntityList.add(memoryStudy);
        participantStudyEntityList.add(dietStudy);
        participantStudyEntityList.add(exerciseStudy);
        return participantStudyEntityList;
    }

    private String generateGUID(){
        UUID randomId = java.util.UUID.randomUUID();
        return randomId.toString();
    }

    public UpdateStatus updateParticipantStudy(ParticipantStudy participantStudy) {
        try {
            ParticipantStudyEntity entity = participantStudyEntityRepository.findParticipantStudyEntityByParticipantStudyId(participantStudy.getParticipantStudyId());
            entity.setAccess(participantStudy.getAccess());
            if (Status.IN_PROGRESS.getStatusName().equalsIgnoreCase(participantStudy.getStatus())
                    && Access.EMAIL_PARTICIPANT.getAccessValue().equalsIgnoreCase(participantStudy.getAccess())) {
                entity.setStatus(Status.EMAIL_IN_PROGRESS.getStatusName());
            } else if (Status.EMAIL_IN_PROGRESS.getStatusName().equalsIgnoreCase(participantStudy.getStatus())
                    && !Access.EMAIL_PARTICIPANT.getAccessValue().equalsIgnoreCase(participantStudy.getAccess())) {
                entity.setStatus(Status.IN_PROGRESS.getStatusName());
            } else if (Status.SEND_EMAIL.getStatusName().equalsIgnoreCase(participantStudy.getStatus())
                    && !Access.EMAIL_PARTICIPANT.getAccessValue().equalsIgnoreCase(participantStudy.getAccess())) {
                if(Strings.isNullOrEmpty(participantStudy.getStudyInformation())){
                    entity.setStatus(Status.NOT_STARTED.getStatusName());
                }else {
                    entity.setStatus(Status.IN_PROGRESS.getStatusName());
                }

            }else if ("completed".equalsIgnoreCase(participantStudy.getStatus())) {
                entity.setStatus(Status.SUBMITTED.getStatusName());
                entity.setCompletedTime(new Date());
            } else {
                entity.setStatus(participantStudy.getStatus());
            }

            participantStudyEntityRepository.saveAndFlush(entity);

            return UpdateStatus.builder()
                    .status(StatusFlag.SUCCESS)
                    .build();
        } catch (Exception e) {
            return UpdateStatus.builder()
                    .status(StatusFlag.FAILURE)
                    .message(e.getMessage())
                    .build();
        }
    }

    public UpdateStatus sendMail(ParticipantStudy participantStudy) {
        try {
            String email=participantStudy.getEmail();

            ParticipantEmailEntity emailEntity = participantEmailEntityRepository.findByParticipantId(participantStudy.getParticipantId());


            if (Objects.nonNull(emailEntity)) {
                emailEntity.setEmail(email);
            }else {
                emailEntity=ParticipantEmailEntity.builder()
                        .participantId(participantStudy.getParticipantId())
                        .email(email)
                        .build();
            }
            participantEmailEntityRepository.saveAndFlush(emailEntity);

            ParticipantStudyEntity participantStudyEntity=participantStudyEntityRepository.findParticipantStudyEntityByParticipantStudyId(participantStudy.getParticipantStudyId());
            String quid = participantStudyEntity.getQuid();
            String mailUrl=url.concat(quid);
            ParticipantsEntity participant = participantsEntityRepository.findByParticipantId(participantStudy.getParticipantId());
            StudyEntity studyEntity = studyEntityRepository.findByStudyId(participantStudyEntity.getStudyId());
            generateEmail(email, userName, participant.getLastName(), mailUrl, studyEntity.getStudyName());

            participantStudyEntity.setStatus(Status.SEND_EMAIL.getStatusName());
            participantStudyEntityRepository.saveAndFlush(participantStudyEntity);
            return UpdateStatus.builder().status(StatusFlag.SUCCESS).build();
        } catch (Exception e) {
            e.printStackTrace();
            return UpdateStatus.builder().status(StatusFlag.FAILURE).build();
        }
    }
}
