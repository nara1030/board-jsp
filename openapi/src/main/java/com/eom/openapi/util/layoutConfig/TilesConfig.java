package com.eom.openapi.util.layoutConfig;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@Configuration
public class TilesConfig {
    private static final Logger LOGGER = LoggerFactory.getLogger(TilesConfig.class);

    @Bean
    public TilesConfigurer tilesConfigurer() {
        final TilesConfigurer tilesConfigurer = new TilesConfigurer();
        LOGGER.info(" Logger 정보: {}", tilesConfigurer);
        tilesConfigurer.setDefinitions(new String[]{"/WEB-INF/tiles.xml"});
        LOGGER.info(" XML 정보: {}", new String[]{"/WEB-INF/tiles.xml"});
        tilesConfigurer.setCheckRefresh(true);
        return tilesConfigurer;
    }

    // UrlBasedViewResolver or TilesViewResolver
    @Bean
    public UrlBasedViewResolver tilesViewResolver() {
        final UrlBasedViewResolver urlBasedViewResolver = new UrlBasedViewResolver();
        urlBasedViewResolver.setViewClass(TilesView.class);
        urlBasedViewResolver.setOrder(1);
        return urlBasedViewResolver;
    }
}
