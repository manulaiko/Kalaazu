package com.kalaazu.cms.dto;

import lombok.Data;

/**
 * Company DTO.
 * ============
 * <p>
 * DTO for the company table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Data
public class CompanyDTO {
    private int id;
    private String name;
    private String tag;
    private String description;
}
