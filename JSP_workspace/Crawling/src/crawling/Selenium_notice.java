package crawling;

import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class Selenium_notice {

	private static String id = "webdriver.chrome.driver";
	private static String path = "D:/chromedriver.exe";
	
	public static void main(String[] args) {
		String url="";
		int i=27;
		int j=10;
		
			int k=1;
			// WebDriver 경로 설정
			System.setProperty(id, path);
			
			WebDriver driver = new ChromeDriver();
			for(i=27;i>=0; i--) {
				for(j=10;j>=1;j--) {
					System.out.println((i*10+j)+"번째");
					
					url = "https://kream.co.kr/notice/"+(i*10+j);
					driver.get(url);
					WebElement e;
					try {
						e = driver.findElement(By.xpath("//*[@id=\"__layout\"]/div/div[1]/div[2]/div[2]/div/div[2]"));
						
					} catch(NoSuchElementException ex) {
						System.out.println("게시글 없음");
						j--;
					}
					
					System.out.println();
					System.out.println();
					System.out.println(e.getText());
					
					
					WebElement click = driver.findElement(By.xpath("//*[@id=\"__layout\"]/div/div[1]/div[2]/div[2]/div/div[3]/a"));
					
					// 목록페이지로 이동
					click.click();
					
					if((i*10+j)%10==9) {
						//공지사항 목록 페이지주소
						url = "https://kream.co.kr/notice?page="+k;
						driver.get(url);
						click = driver.findElement(By.xpath("//*[@id=\"__layout\"]/div/div[1]/div[2]/div[2]/div/div[2]/div/div[2]/a[1]"));
						click.click();
						k++;
										
					}
				}
			}
		
		

		
	}
}
