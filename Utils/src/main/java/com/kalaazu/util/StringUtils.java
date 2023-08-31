package com.kalaazu.util;

import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;

import java.util.concurrent.ThreadLocalRandom;
import java.util.regex.Pattern;

/**
 * String utils.
 * =============
 * <p>
 * Random util methods for strings.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class StringUtils {
    /**
     * Email regex.
     */
    private static final Pattern emailPattern = Pattern.compile("^[A-Za-z0-9._]{1,16}+@{1}+[a-z]{1,7}\\.[a-z]{1,3}$");

    /**
     * Argon instance.
     */
    private static final Argon2 argon = Argon2Factory.create();

    /**
     * Checks that string is a valid email.
     *
     * @param s String to check.
     * @return Whether `s` is a valid email address or not.
     */
    public static boolean isEmail(String s) {
        return StringUtils.emailPattern.matcher(s)
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

    /**
     * Hashes a string with Argon2.
     *
     * @param s String to hash.
     * @return Hashed string.
     */
    public static String hash(String s) {
        return StringUtils.argon.hash(2, 65536, 1, s.toCharArray());
    }

    /**
     * Verifies a hash.
     *
     * @param hash     Hashed string.
     * @param password String to verify.
     * @return Whether `string` is `hash` or not.
     */
    public static boolean verify(String hash, String password) {
        return StringUtils.argon.verify(hash, password.toCharArray());
    }
}
