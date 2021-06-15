package com.beaver.config;


//@Configuration
//@EnableWebMvc
//@ComponentScan
//public class WebViewConfig implements WebMvcConfigurer {
//
//    @Bean
//    public ViewResolver viewResolver() {
//        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
//        resolver.setPrefix("/WEB-INF/"); //配置放置jsp文件夹
//        resolver.setSuffix(".jsp");
//        resolver.setViewNames("jsp/*");  //重要 setViewNames 通过它识别为jsp页面引擎
//        resolver.setOrder(2);
//        return resolver;
//    }
//
//    @Bean
//    public ITemplateResolver templateResolver() {
//        SpringResourceTemplateResolver templateResolver = new SpringResourceTemplateResolver();
//        templateResolver.setTemplateMode("HTML");
//        templateResolver.setPrefix("classpath:/static/");
//        templateResolver.setSuffix(".html");
//        templateResolver.setCharacterEncoding("utf-8");
//        templateResolver.setCacheable(false);
//        return templateResolver;
//    }
//
//    private static final String[] CLASSPATH_RESOURCE_LOCATIONS = {
//            "classpath:/META-INF/resources/", "classpath:/resources/",
//            "classpath:/static/", "classpath:/public/"
//    };
//
//    @Override
//    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry.addResourceHandler("/**")
//                .addResourceLocations(CLASSPATH_RESOURCE_LOCATIONS);
//    }
//
//
//}
