package com.adapt.repository;

import com.adapt.entity.TimelineIntervalEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TimelineIntervalRepository extends JpaRepository<TimelineIntervalEntity, Integer> {
}
