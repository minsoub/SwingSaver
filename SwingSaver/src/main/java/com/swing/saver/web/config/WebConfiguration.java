package com.swing.saver.web.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ResourceLoader;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.mustache.MustacheViewResolver;
import org.springframework.web.servlet.view.mustache.java.MustacheJTemplateFactory;

@EnableWebMvc
@Configuration
@ComponentScan
public class WebConfiguration {
    @Autowired
    ResourceLoader resourceLoader;

    @Bean
    public ViewResolver viewResolver() {
        MustacheViewResolver mustacheViewResolver = new MustacheViewResolver();
        mustacheViewResolver.setPrefix("/WEB-INF/views/");
        mustacheViewResolver.setSuffix(".html");
        mustacheViewResolver.setCache(false);

        MustacheJTemplateFactory templateFactory = new MustacheJTemplateFactory();
        templateFactory.setResourceLoader(resourceLoader);
        mustacheViewResolver.setTemplateFactory(templateFactory);
        return mustacheViewResolver;
    }
}