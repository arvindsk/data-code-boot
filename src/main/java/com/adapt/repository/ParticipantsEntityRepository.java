package com.adapt.repository;

import com.adapt.entity.ParticipantsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface ParticipantsEntityRepository extends JpaRepository<ParticipantsEntity, Integer>, JpaSpecificationExecutor<ParticipantsEntity> {

    List<ParticipantsEntity> findAll();
}
