package com.kalaazu.cms.dto;

import lombok.Data;

/**
 * Register request.
 * =================
 *
 * Request body for a register request.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Data
public class RegisterRequest extends LoginRequest {
    private String email;
}
