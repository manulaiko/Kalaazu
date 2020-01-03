package com.kalaazu.cms.controller;

import com.kalaazu.cms.dto.LoginRequest;
import com.kalaazu.cms.dto.LoginResponse;
import com.kalaazu.cms.dto.RegisterRequest;
import com.kalaazu.cms.dto.Response;
import com.kalaazu.persistence.entity.UsersEntity;
import com.kalaazu.persistence.service.AccountsService;
import com.kalaazu.persistence.service.UsersService;
import com.kalaazu.util.StringUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.Instant;
import java.util.Date;

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
    private UsersService usersService;

    @Autowired
    private AccountsService accountsService;

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

        if (body.getUsername().isEmpty() || body.getPassword().isEmpty()) {
            response.setKind("bad-data");

            return ResponseEntity.ok(response);
        }

        var user = usersService.login(body.getUsername(), body.getPassword());
        if (user == null) {
            response.setKind("not-found");

            return ResponseEntity.ok(response);
        }

        // Filter out banned accounts.
        // Last logged in account.
        var lastUsedAccount = user.getAccounts()
                                  .stream()
                                  .filter(
                                          // Filter out banned accounts.
                                          a -> a.getBanDate() != null &&
                                               a.getBanDate().compareTo(Date.from(Instant.now())) < 0
                                  )
                                  .min(
                                          // Last logged in account.
                                          (a1, a2) -> a2.getLastLogin().compareTo(a1.getLastLogin())
                                  )
                                  .orElse(null);

        if (lastUsedAccount == null) {
            response.setKind("rejected");

            return ResponseEntity.ok(response);
        }

        // Generate new session ID.
        lastUsedAccount.setSessionId(StringUtils.random(32));
        this.accountsService.update(lastUsedAccount);

        var data = new LoginResponse();
        data.setSessionId(lastUsedAccount.getSessionId());

        response.setKind("ok");
        response.setData(data);

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

        if (body.getUsername().isEmpty() || body.getPassword().isEmpty() || body.getEmail().isEmpty()) {
            response.setKind("bad-data");

            return ResponseEntity.ok(response);
        }

        UsersEntity user;
        try {
            user = usersService.register(body.getUsername(), body.getPassword(), body.getEmail());
        } catch (Exception e) {
            response.setKind("other");
            response.setMessage(e.getMessage());

            return ResponseEntity.ok(response);
        }

        var data = new LoginResponse();

        response.setKind("ok");
        response.setData(data);

        return ResponseEntity.ok(response);
    }
}
