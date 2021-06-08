package com.adapt.repository;

import com.adapt.entity.QuestionnaireEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface QuestionnaireEntityRepository extends JpaRepository<QuestionnaireEntity, String>, JpaSpecificationExecutor<QuestionnaireEntity> {

}
