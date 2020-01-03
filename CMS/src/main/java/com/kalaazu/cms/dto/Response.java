package com.kalaazu.cms.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Response.
 * =========
 *
 * Base class for all responses.
 *
 * @param T Response data type.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Response<T> {
    private String kind;
    private String message;
    private T      data;
}
