package com.kbstar.dto;

import lombok.*;

import javax.validation.Valid;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Cust {

    /*
        화면에서도 막지만 값이 들어갈 때도 막는다.
     */
    @Size(min=4, max=10, message="ID는 최소4개 최대10개 입니다.")
    @NotEmpty(message = "ID는 필수 항목입니다.")
    private String id;

    @Size(min=4, max=10, message="PWD는 최소4개 최대10개 입니다.")
    @NotEmpty(message = "PWD는 필수 항목입니다.")
    private String pwd;

    @NotEmpty(message= "NAME은 필수 항목입니다.")
    private String name;
}
