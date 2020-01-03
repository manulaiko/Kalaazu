package com.kalaazu.cms.controller;

import com.kalaazu.cms.dto.LoginRequest;
import com.kalaazu.cms.dto.LoginResponse;
import com.kalaazu.cms.dto.RegisterRequest;
import com.kalaazu.cms.dto.Response;
import com.kalaazu.cms.service.LoginService;
import com.kalaazu.cms.service.RegisterService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
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
    @Autowired
    private LoginService login;

    @Autowired
    private RegisterService register;

    /**
     * Login endpoint.
     *
     * @param body Request body.
     *
     * @return Response entity.
     */
    @PostMapping("/login")
    public ResponseEntity<Response<LoginResponse>> login(@RequestBody LoginRequest body) {
        var response = new Response<LoginResponse>("other", "Couldn't perform login!", null);

        try {
            var sessionId = this.login.login(body.getUsername(), body.getPassword());

            var data = new LoginResponse();
            data.setSessionId(sessionId);

            response.setKind("ok");
            response.setData(data);
        } catch (Exception e) {
            response.setKind("other");
            response.setMessage(e.getMessage());
        }

        return ResponseEntity.ok(response);
    }

    /**
     * Register endpoint.
     *
     * @param body Request body.
     *
     * @return Response entity.
     */
    public ResponseEntity<Response<LoginResponse>> register(@RequestBody RegisterRequest body) {
        var response = new Response<LoginResponse>("other", "Couldn't perform register!", null);

        try {
            var sessionId = this.register.register(body.getUsername(), body.getPassword(), body.getEmail());

            var data = new LoginResponse();
            data.setSessionId(sessionId);

            response.setKind("ok");
            response.setData(data);
        } catch (Exception e) {
            response.setKind("other");
            response.setMessage(e.getMessage());
        }

        return ResponseEntity.ok(response);
    }
}
