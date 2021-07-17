package com.adapt.repository;

import com.adapt.entity.QuestionnairesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface QuestionnairesEntityRepository extends JpaRepository<QuestionnairesEntity, Integer>, JpaSpecificationExecutor<QuestionnairesEntity> {
    QuestionnairesEntity findQuestionnairesEntitiesByStudyId(Integer studyId);

}
