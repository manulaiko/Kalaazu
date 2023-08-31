package com.kalaazu.cms.controller;

import com.kalaazu.cms.dto.CompanyDTO;
import com.kalaazu.cms.dto.Response;
import lombok.Data;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Comapny Controller.
 * ===================
 * <p>
 * Controller for the `/company` endpoint.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Data
@RestController
@RequestMapping("/company")
public class CompanyController {
    /**
     * Returns the list of public companies.
     *
     * @return List of public companies.
     */
    @GetMapping
    public ResponseEntity<Response<List<CompanyDTO>>> list() {
        return (ResponseEntity<Response<List<CompanyDTO>>>) ResponseEntity.noContent();
    }
}
