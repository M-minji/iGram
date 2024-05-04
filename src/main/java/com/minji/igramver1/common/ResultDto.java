package com.minji.igramver1.common;

import lombok.Builder;
import lombok.Data;
import org.springframework.http.HttpStatus;

@Data
@Builder
public class ResultDto<T> {
    private HttpStatus statusCode;
    private String resultMsg;
    private T resultData;

    public static <T> ResultDto<T> returnDto (HttpStatus statusCode, String resultMsg, T resultData) {
        return ResultDto.<T>builder()
                .statusCode(statusCode)
                .resultMsg(resultMsg)
                .resultData(resultData)
                .build();
    }
}
