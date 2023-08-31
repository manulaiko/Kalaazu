package com.kalaazu;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Launcher class.
 * ===============
 * <p>
 * The starting point of the application.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Slf4j
@SpringBootApplication
public class Launcher {
    /**
     * Main method.
     *
     * @param args Command line arguments.
     */
    public static void main(String[] args) {
        log.info("Starting Kalaazu...");
        SpringApplication.run(Launcher.class);
    }
}
