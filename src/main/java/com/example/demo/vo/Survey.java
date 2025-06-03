package com.example.demo.vo;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Survey {
    private int id;
    private int memberId;
    private String seatPreference;
    private String mateGender;
    private String cheeringStyle;
    private LocalDateTime regDate;
}
