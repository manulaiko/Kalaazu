package com.kalaazu.cms.controller;

import com.kalaazu.cms.dto.*;
import com.kalaazu.cms.service.LoginService;
import com.kalaazu.cms.service.RegisterService;
import com.kalaazu.persistence.entity.AccountsEntity;
import com.kalaazu.persistence.entity.ItemType;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * External controller.
 * ====================
 * <p>
 * Controller for the `/external` endpoint.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Slf4j
@RestController
@RequestMapping("/external")
@RequiredArgsConstructor
public class ExternalController {
    private final LoginService login;
    private final RegisterService register;
    private final ModelMapper mapper;

    /**
     * Login endpoint.
     *
     * @param body Request body.
     * @return Response entity.
     */
    @PostMapping("/login")
    public ResponseEntity<Response<LoginResponse>> login(@RequestBody LoginRequest body) {
        var response = new Response<LoginResponse>(Response.Status.ERROR, "Couldn't perform login!", null);

        try {
            var account = this.login.login(body.getUsername(), body.getPassword());

            var data = new LoginResponse();
            data.setAccount(this.buildAccount(account));

            response.setStatus(Response.Status.OK);
            response.setData(data);
        } catch (Exception e) {
            response.setStatus(Response.Status.ERROR);
            response.setMessage(e.getMessage());
        }

        return ResponseEntity.ok(response);
    }

    /**
     * Register endpoint.
     *
     * @param body Request body.
     * @return Response entity.
     */
    @PostMapping("/register")
    public ResponseEntity<Response<LoginResponse>> register(@RequestBody RegisterRequest body) {
        var response = new Response<LoginResponse>(Response.Status.ERROR, "Couldn't perform register!", null);

        try {
            var account = this.register.register(body.getUsername(), body.getPassword(), body.getEmail());

            var data = new LoginResponse();
            data.setAccount(this.buildAccount(account));

            response.setStatus(Response.Status.OK);
            response.setData(data);
        } catch (Exception e) {
            response.setStatus(Response.Status.ERROR);
            response.setMessage(e.getMessage());
        }

        return ResponseEntity.ok(response);
    }

    /**
     * Builds the account DTO.
     *
     * @param account Account entity.
     * @return Account DTO for `account`.
     */
    private Account buildAccount(AccountsEntity account) {
        var a = new Account();
        this.mapper.map(account, a);

        account.getAccountsItems()
                .forEach(i -> {
                    if (i.getItemsByItemsId().getType() != ItemType.CURRENCY) {
                        return;
                    }

                    switch (i.getItemsByItemsId().getId()) {
                        case 1 -> // Credits
                                a.setCredits(i.getAmount());
                        case 2 -> // Uridium
                                a.setUridium((int) i.getAmount());
                        case 3 -> // Jackpot
                                a.setJackpot((int) i.getAmount());
                        case 4 -> // Experience
                                a.setExperience(i.getAmount());
                        case 5 -> // Honor
                                a.setHonor((int) i.getAmount());
                    }
                });

        return a;
    }
}
