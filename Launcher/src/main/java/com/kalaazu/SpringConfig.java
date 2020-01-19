package com.kalaazu;

import org.modelmapper.AbstractConverter;
import org.modelmapper.ModelMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.sql.Timestamp;

/**
 * Spring configuration class.
 * ===========================
 *
 * Global Spring configuration.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Configuration
public class SpringConfig {
    /**
     * Returns the ModelMapper instance.
     *
     * @return Model mapper instance.
     */
    @Bean
    public ModelMapper modelMapper() {
        var mapper = new ModelMapper();

        // Map timestamps to string.
        mapper.addConverter(new AbstractConverter<Timestamp, String>() {
            /**
             * @inheritDoc
             */
            @Override
            protected String convert(Timestamp source) {
                System.out.println(source);
                if (source == null) {
                    return null;
                }

                return source.toString();
            }
        });

        return mapper;
    }
}
