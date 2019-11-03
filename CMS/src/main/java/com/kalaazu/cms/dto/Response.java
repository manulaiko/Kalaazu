package com.kalaazu.cms.dto;

import lombok.Data;

/**
 * Response.
 * =========
 *
 * Base class for all responses.
 *
 * @param T Response data type.
 */
@Data
public class Response<T> {
    private String kind;
    private T      data;
}
