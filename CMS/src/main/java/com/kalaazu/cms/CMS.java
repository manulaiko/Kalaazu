package com.kalaazu.cms;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * CMS class.
 * ==========
 *
 * Serves as the module's facade.
 *
 * Use `CMSBuilder` to instantiate this class.
 *
 * Once instantiated you can use the `start`, `stop` or `restart`
 * methods to manage the HTTP server.
 *
 * Example:
 *
 * ```java
 * if (cms.isRunning()) {
 * cms.stop();
 * }
 *
 * cms.start();
 * ```
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@RestController
@Slf4j
public class CMS {
    /**
     * Request filter.
     *
     * Forward request to Frontend's router.
     */
    @RequestMapping(value = "/External")
    public String redirect() {
        return "forward:/";
    }
}
