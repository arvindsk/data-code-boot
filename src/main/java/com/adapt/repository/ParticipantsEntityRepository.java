package com.adapt.repository;

import com.adapt.entity.ParticipantsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface ParticipantsEntityRepository extends JpaRepository<ParticipantsEntity, String>, JpaSpecificationExecutor<ParticipantsEntity> {

}
