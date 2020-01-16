package com.kalaazu;

import org.modelmapper.ModelMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

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
        return new ModelMapper();
    }
}
