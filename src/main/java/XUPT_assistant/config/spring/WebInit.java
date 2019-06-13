package XUPT_assistant.config.spring;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration;

public class WebInit extends AbstractAnnotationConfigDispatcherServletInitializer {

    //创建ContextLoaderListener应用上下文
    protected Class<?>[] getRootConfigClasses() {
        return new Class<?>[] {RootConfig.class};
    }

    //创建DispatcherServlet应用上下文
    protected Class<?>[] getServletConfigClasses() {
        return new Class<?>[] {WebConfig.class};
    }

    //将DispatcherServlet映射到/
    protected String[] getServletMappings() {
        return new String[] {"/"};
    }

    //Multipart临时缓存的位置及限制
    @Override
    protected void customizeRegistration(ServletRegistration.Dynamic registration){
        registration.setMultipartConfig(new MultipartConfigElement
                ("/home/huxudong/upload",1024 * 1024 * 8,
                        1024 * 1024 * 100,1024 * 1024 * 8));
    }
}

