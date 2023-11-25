package training;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import com.mysql.cj.jdbc.MysqlDataSource;

import lombok.val;

/**
 * Configuração programática de Beans do Spring para este projeto.
 *
 * @author Davi Bezerra
 *
 */
@Configuration
public class SpringConfig {

    public static @Bean MapperScannerConfigurer mapperScannerConfigurer() {
		val configurer = new MapperScannerConfigurer();
		configurer.setBasePackage("training.mapper");

		return configurer;
	}

    public @Bean SqlSessionFactoryBean sqlSessionFactory(DataSource dataSource) throws Exception {
		val factory = new SqlSessionFactoryBean();
		factory.setConfigLocation(new ClassPathResource("mybatis.xml"));
        factory.setDataSource(dataSource);

		return factory;
	}

	public @Bean DataSourceTransactionManager txManager(DataSource dataSource) {
		return new DataSourceTransactionManager(dataSource);
	}

	public @Bean DataSource dataSource() throws SQLException {

        val source = new MysqlDataSource();
        source.setServerName("localhost");
        source.setPort(3306);
        source.setDatabaseName("starter");
        source.setUser("root");
        source.setPassword("1234");
        source.setUseSSL(false);
        source.setServerTimezone("GMT-3");

        return source;
    }

}
