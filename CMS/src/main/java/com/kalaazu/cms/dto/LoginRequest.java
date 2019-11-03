package com.kalaazu.cms.dto;

import lombok.Data;

/**
 * Login request.
 * ==============
 *
 * DTO for the login request body.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Data
public class LoginRequest {
    private String username;
    private String password;
}
