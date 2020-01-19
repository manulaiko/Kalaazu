package com.kalaazu.cms.controller;

import com.kalaazu.cms.dto.*;
import com.kalaazu.cms.service.LoginService;
import com.kalaazu.cms.service.RegisterService;
import com.kalaazu.persistence.entity.AccountsEntity;
import com.kalaazu.persistence.entity.ItemType;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
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

    @Autowired
    private ModelMapper mapper;

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
            var account = this.login.login(body.getUsername(), body.getPassword());

            var data = new LoginResponse();
            data.setAccount(this.buildAccount(account));

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
    @PostMapping("/register")
    public ResponseEntity<Response<LoginResponse>> register(@RequestBody RegisterRequest body) {
        var response = new Response<LoginResponse>("other", "Couldn't perform register!", null);

        try {
            var account = this.register.register(body.getUsername(), body.getPassword(), body.getEmail());

            var data = new LoginResponse();
            data.setAccount(this.buildAccount(account));

            response.setKind("ok");
            response.setData(data);
        } catch (Exception e) {
            response.setKind("other");
            response.setMessage(e.getMessage());
        }

        return ResponseEntity.ok(response);
    }

    /**
     * Builds the account DTO.
     *
     * @param account Account entity.
     *
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
                       case 1: // Credits
                           a.setCredits(i.getAmount());
                           break;

                       case 2: // Uridium
                           a.setUridium((int) i.getAmount());
                           break;

                       case 3: // Jackpot
                           a.setJackpot((int) i.getAmount());
                           break;

                       case 4: // Experience
                           a.setExperience(i.getAmount());
                           break;

                       case 5: // Honor
                           a.setHonor((int) i.getAmount());
                           break;
                   }
               });

        return a;
    }
}
