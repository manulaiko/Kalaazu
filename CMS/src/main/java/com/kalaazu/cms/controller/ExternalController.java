package com.kalaazu.cms.controller;

import com.kalaazu.cms.dto.LoginRequest;
import com.kalaazu.cms.dto.LoginResponse;
import com.kalaazu.cms.dto.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * External controller.
 * ====================
 *
 * Controller for the `/external` endpoint.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Slf4j
@RestController
@RequestMapping("/external")
public class ExternalController {
    /**
     * Login endpoint.
     *
     * @param body Request body.
     *
     * @return Response entity.
     */
    @PostMapping("/login")
    public ResponseEntity<Response<LoginResponse>> login(@RequestBody LoginRequest body) {
        var response = new Response<LoginResponse>();
        response.setKind("unknown");

        log.info(body.toString());

        if (body.getUsername().isEmpty() || body.getPassword().isEmpty()) {
            response.setKind("bad-data");
        }

        return ResponseEntity.ok(response);
    }
}
