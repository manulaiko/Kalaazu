package com.kalaazu.cms.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Register request.
 * =================
 *
 * Request body for a register request.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class RegisterRequest extends LoginRequest {
    private String email;
}
