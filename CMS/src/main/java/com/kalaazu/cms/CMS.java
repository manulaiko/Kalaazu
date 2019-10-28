package com.kalaazu.cms;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;

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
@Controller
@Slf4j
public class CMS {
}
