package com.kbstar.dto;

import lombok.*;

@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Adm {
    private String id;
    private String pwd;
    private int lev;
}
