package com.kalaazu.cms.server;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Request annotation.
 * ===================
 *
 * Used to annotate controller methods that
 * accept any method requests.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface Request {
}
