package com.kalaazu.util;

import org.slf4j.LoggerFactory;
import org.slf4j.MDC;
import org.slf4j.helpers.FormattingTuple;
import org.slf4j.helpers.MessageFormatter;
import org.springframework.boot.logging.LogLevel;

/**
 * Logger interface.
 * <p>
 * Performs logging with context variables.
 *
 * @author manulaiko
 */
public interface Logger {
    org.slf4j.Logger log = LoggerFactory.getLogger(Logger.class);

    default org.slf4j.Logger logger() {
        return LoggerFactory.getLogger(this.getClass());
    }

    // Simple message overloads
    default void trace(String message) {
        trace(getCategory(), message);
    }

    default void trace(String message, Exception e) {
        trace(getCategory(), message, e);
    }

    default void debug(String message) {
        debug(getCategory(), message);
    }

    default void debug(String message, Exception e) {
        debug(getCategory(), message, e);
    }

    default void info(String message) {
        info(getCategory(), message);
    }

    default void warn(String message) {
        warn(getCategory(), message);
    }

    default void warn(String message, Exception e) {
        warn(getCategory(), message, e);
    }

    default void error(String message) {
        error(getCategory(), message);
    }

    default void error(String message, Exception e) {
        error(getCategory(), message, e);
    }

    // SLF4J-style parameterized overloads
    default void trace(String message, Object... args) {
        trace(getCategory(), message, args);
    }

    default void debug(String message, Object... args) {
        debug(getCategory(), message, args);
    }

    default void info(String message, Object... args) {
        info(getCategory(), message, args);
    }

    default void warn(String message, Object... args) {
        warn(getCategory(), message, args);
    }

    default void error(String message, Object... args) {
        error(getCategory(), message, args);
    }

    default void trace(LoggingCategory category, String message) {
        trace(category, message, (Exception) null);
    }

    default void trace(LoggingCategory category, String message, Exception e) {
        log(LogLevel.TRACE, category, message, e);
    }

    // Category overloads with varargs
    default void trace(LoggingCategory category, String message, Object... args) {
        log(LogLevel.TRACE, category, message, args);
    }

    default void debug(LoggingCategory category, String message) {
        debug(category, message, (Exception) null);
    }

    default void debug(LoggingCategory category, String message, Exception e) {
        log(LogLevel.DEBUG, category, message, e);
    }

    default void debug(LoggingCategory category, String message, Object... args) {
        log(LogLevel.DEBUG, category, message, args);
    }

    default void info(LoggingCategory category, String message) {
        info(category, message, (Exception) null);
    }

    default void info(LoggingCategory category, String message, Exception e) {
        log(LogLevel.INFO, category, message, e);
    }

    default void info(LoggingCategory category, String message, Object... args) {
        log(LogLevel.INFO, category, message, args);
    }

    default void warn(LoggingCategory category, String message) {
        warn(category, message, (Exception) null);
    }

    default void warn(LoggingCategory category, String message, Exception e) {
        log(LogLevel.WARN, category, message, e);
    }

    default void warn(LoggingCategory category, String message, Object... args) {
        log(LogLevel.WARN, category, message, args);
    }

    default void error(LoggingCategory category, String message) {
        error(category, message, (Exception) null);
    }

    default void error(LoggingCategory category, String message, Exception e) {
        log(LogLevel.ERROR, category, message, e);
    }

    default void error(LoggingCategory category, String message, Object... args) {
        log(LogLevel.ERROR, category, message, args);
    }

    // Core vararg logging that mimics SLF4J `{}` formatting
    default void log(LogLevel level, LoggingCategory category, String message, Object... args) {
        Throwable cause = null;
        Object[] fmtArgs = args;
        if (fmtArgs != null && fmtArgs.length > 0) {
            var last = fmtArgs[fmtArgs.length - 1];
            if (last instanceof Throwable t) {
                cause = t;
                fmtArgs = java.util.Arrays.copyOf(fmtArgs, fmtArgs.length - 1);
            }
        }

        FormattingTuple tuple = MessageFormatter.arrayFormat(message, fmtArgs);
        Throwable t = tuple.getThrowable();
        if (cause == null && t != null) {
            cause = t;
        }

        Exception e = null;
        if (cause != null) {
            e = (cause instanceof Exception ex) ? ex : new Exception(cause);
        }

        log(level, category, tuple.getMessage(), e);
    }

    default void log(LogLevel level, LoggingCategory category, String message, Exception e) {
        MDC.put("category", category.name());

        try {
            var builder = logger().atInfo();

            switch (level) {
                case TRACE -> builder = logger().atTrace();
                case DEBUG -> builder = logger().atDebug();
                case INFO -> builder = logger().atInfo();
                case WARN -> builder = logger().atWarn();
                case ERROR, FATAL -> builder = logger().atError();
                case OFF -> {
                    return;
                }
            }

            if (getUserId() != 0) {
                builder = builder.addKeyValue("userId", getUserId());
            }
            if (getMapId() != 0) {
                builder = builder.addKeyValue("mapId", getMapId());
            }
            builder = builder.addKeyValue("category", category);

            if (e != null) {
                builder = builder.setCause(e);
            }

            builder.log(message);
        } finally {
            MDC.remove("category");
        }
    }

    LoggingCategory getCategory();

    default long getUserId() {
        return 0;
    }

    default short getMapId() {
        return 0;
    }
}
