package com.kalaazu.cms.dto;

import lombok.Data;

/**
 * Login response.
 * ===============
 * <p>
 * DTO for the login response body.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Data
public class LoginResponse {
    private Account account;
}
