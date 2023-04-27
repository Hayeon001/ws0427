package com.kbstar.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Marker {

    private int id;
    private String title;
    private String target;
    private Double lat; //소수점
    private Double lng; //소수점
    private String img;
    private String loc;

}
