package com.adapt.repository;

import com.adapt.entity.QuestionnaireTriggersEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface QuestionnaireTriggersEntityRepository extends JpaRepository<QuestionnaireTriggersEntity, Integer>, JpaSpecificationExecutor<QuestionnaireTriggersEntity> {

}
