package com.kalaazu.cms.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Response.
 * =========
 * <p>
 * Base class for all responses.
 *
 * @param T Response data type.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Response<T> {
    private Status status;
    private String message;
    private T data;

    public enum Status {
        ERROR,
        OK
    }
}
