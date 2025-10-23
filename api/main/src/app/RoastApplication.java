package roast.app;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

@SpringBootApplication(scanBasePackages = "roast")
@EntityScan(basePackages = "roast.models")
@EnableJpaRepositories(basePackages = "roast.repositories")
@EnableMongoRepositories(basePackages = "roast.repositories")
public class RoastApplication {
	public static void main(String[] args) {
		SpringApplication.run(RoastApplication.class, args);
	}
}

