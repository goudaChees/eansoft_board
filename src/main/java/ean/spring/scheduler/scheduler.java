package ean.spring.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class scheduler {
	
	int num = 1;
	
	@Scheduled(cron = "0 * 15 * * *")
	public void autoUpdate() {
		
		System.out.println("15hour Scheduled Automatic : "+num);
		num++;
	}
}
