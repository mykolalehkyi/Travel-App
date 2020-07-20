package com.mykolalehkyi.travelapp.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.CacheControl;
import org.springframework.web.servlet.config.annotation.*;

import java.util.concurrent.TimeUnit;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = { "com.mykolalehkyi.travelapp.controller" })
public class WebConfig implements WebMvcConfigurer {
  @Override
  public void configureViewResolvers(ViewResolverRegistry registry) {
    registry.jsp().prefix("/WEB-INF/views/").suffix(".jsp");
  }

  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {

    // Register resource handler for CSS and JS and images
    registry.addResourceHandler("/resources/**").addResourceLocations("/resources/")
            .setCacheControl(CacheControl.maxAge(2, TimeUnit.HOURS).cachePublic());
  }

  @Override
  public void addViewControllers(ViewControllerRegistry registry) {
    registry.addViewController("/login").setViewName("login");
    registry.addViewController("/registration").setViewName("registration");
  }
}
