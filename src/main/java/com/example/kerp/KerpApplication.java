package com.example.kerp;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
// 👇 加上这一行，把包名换成你自己的 Mapper 所在包路径
@MapperScan("com.example.kerp.modules.**.mapper")
public class KerpApplication {

	public static void main(String[] args) {
		SpringApplication.run(KerpApplication.class, args);
	}

}
