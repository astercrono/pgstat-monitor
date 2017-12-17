package net.astercrono.pgstat;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

import net.astercrono.pgstat.model.Config;

@SpringBootApplication
@EnableConfigurationProperties(Config.class)
public class Application
{
	public static void main(String[] args)
	{
		SpringApplication.run(Application.class, args);
	}
}