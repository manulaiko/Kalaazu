package com.kalaazu.util;

import java.util.concurrent.ThreadLocalRandom;
import java.util.regex.Pattern;

/**
 * String utils.
 * =============
 *
 * Random util methods for strings.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class StringUtils {
    /**
     * Email regex.
     */
    private static Pattern pattern = Pattern.compile("^[A-Za-z0-9._]{1,16}+@{1}+[a-z]{1,7}\\.[a-z]{1,3}$");

    /**
     * Checks that string is a valid email.
     *
     * @param s String to check.
     *
     * @return Whether `s` is a valid email address or not.
     */
    public static boolean isEmail(String s) {
        return StringUtils.pattern.matcher(s)
                                  .matches();
    }

    /**
     * Generates a session ID.
     *
     * @return A random session ID.
     */
    public static String sessionId() {
        return StringUtils.random("0123456789abcdef", 32);
    }

    /**
     * Generates a random string of specified length.
     *
     * @param length String length.
     *
     * @return String with `length` length.
     */
    public static String random(int length) {
        return StringUtils.random("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", length);
    }

    /**
     * Generates a random string of specified length.
     *
     * @param chars  Chars that the string should contain.
     * @param length String length.
     *
     * @return String with `l` length.
     */
    public static String random(String chars, int length) {
        var sb = new StringBuilder();
        for (int i = 0; i < length; i++) {
            var r = ThreadLocalRandom.current()
                                     .nextInt(chars.length());

            sb.append(chars.charAt(r));
        }

        return sb.toString();
    }
}
