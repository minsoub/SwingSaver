package com.swing.saver.web.config;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.io.ResourceLoader;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.AbstractUrlBasedView;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.mustache.MustacheViewResolver;
import org.springframework.web.servlet.view.mustache.java.MustacheJTemplateFactory;

//@EnableWebMvc
//@Configuration
//@ComponentScan
public class WebConfiguration extends UrlBasedViewResolver implements Ordered {
	
	@Override
	 protected View loadView(String viewName, Locale locale) throws Exception {
		// TODO Auto-generated method stub
		AbstractUrlBasedView view = buildView(viewName);
		View viewObj = (View)     getApplicationContext().getAutowireCapableBeanFactory().initializeBean(view, viewName);
		if (viewObj instanceof JstlView) {
		  JstlView jv = (JstlView) viewObj;
		  System.out.println(jv.getBeanName());
		  
		  if (jv.getBeanName().indexOf(".mustache") != -1) {
			  
			  return null;
		  }
		}
		return viewObj;
	 }
//	
//	
//    @Autowired
//    ResourceLoader resourceLoader;
//
//    @Bean
//    public ViewResolver viewResolver() {
//    	// InternalResourceViewResolver resolver = new InternalResourceViewResolver();
//    	UrlBasedViewResolver resolver = new UrlBasedViewResolver();
//    	resolver.setViewClass(JstlView.class);
//    	resolver.setPrefix("/WEB-INF/views/");
//    	resolver.setSuffix(".jsp");
//    	resolver.setOrder(1);
//    	return resolver;
//    }
//    
//    
//    @Bean
//    public ViewResolver mustacheViewResolver() {
//        MustacheViewResolver mustacheViewResolver = new MustacheViewResolver();
//        mustacheViewResolver.setPrefix("/WEB-INF/classes/templates/");  // /WEB-INF/views/");
//        mustacheViewResolver.setSuffix(".mustache");
//        mustacheViewResolver.setCache(false);
//        mustacheViewResolver.setOrder(2);
//        
//        MustacheJTemplateFactory templateFactory = new MustacheJTemplateFactory();
//        templateFactory.setResourceLoader(resourceLoader);
//        mustacheViewResolver.setTemplateFactory(templateFactory);
//        return mustacheViewResolver;
//    }
    

}