package ncs_dataio_yoonwonju.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({ContextDataSource.class, ContextSqlSession.class})
@ComponentScan(basePackages = {"ncs_dataio_yoonwonju.mapper"})
public class ControllerConfig {
	
}