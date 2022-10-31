package ean.spring.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class TaskTestService {
	
	@Scheduled(cron = "0 2 15 * * *")
	public void doJob() {
		System.out.println("scheduler");
	}
}
