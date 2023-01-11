package poly.ass;

import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.MultipartConfigElement;

@Configuration
public class ResourceConfig {
	@Bean("messageSource")
	public MessageSource getMessage() {
		ReloadableResourceBundleMessageSource ms = new ReloadableResourceBundleMessageSource();

		ms.setBasename("classpath:messages/valid");
		ms.setDefaultEncoding("UTF-8");

		return ms;
	}
	@Bean
	public MultipartConfigElement multipartConfigElement() {
		MultipartConfigFactory factory = new MultipartConfigFactory();
		// Set max file size (in bytes)


		// Set max request size (in bytes)

		return factory.createMultipartConfig();
	}


}
