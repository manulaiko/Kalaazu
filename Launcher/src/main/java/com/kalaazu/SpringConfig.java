package com.kalaazu;

import org.modelmapper.AbstractConverter;
import org.modelmapper.Converter;
import org.modelmapper.ModelMapper;
import org.modelmapper.spi.MappingContext;
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
        mapper.addConverter((Converter<Timestamp, String>) context -> {
            if (context.getSource() == null) {
                return null;
            }

            return context.getSource().toString();
        });

        return mapper;
    }
}
