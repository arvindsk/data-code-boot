package com.adapt.repository;

import com.adapt.entity.QuestionnaireSequenceEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface QuestionnaireSequenceEntityRepository extends JpaRepository<QuestionnaireSequenceEntity, String>, JpaSpecificationExecutor<QuestionnaireSequenceEntity> {

}
