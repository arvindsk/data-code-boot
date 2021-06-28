package com.adapt.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "medicine_list")
public class MedicineListEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "medicine_id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer medicineId;

    @Column(name = "name")
    private String name;

}
