package com.example.kerp;

import cn.dev33.satoken.secure.BCrypt;
import com.example.kerp.modules.system.entity.SysUser;
import com.example.kerp.modules.system.mapper.SysUserMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class KerpApplicationTests {

	@Test
	void contextLoads() {
		// 模拟用户注册
		String userPassword = "123456";
		String storedHash = BCrypt.hashpw(userPassword);
		System.out.println("存储到数据库的哈希: " + storedHash);

		// 模拟用户登录
		String loginPassword = "123456";
		boolean loginSuccess = BCrypt.checkpw(loginPassword, storedHash);
		System.out.println("登录验证: " + loginSuccess); // true

		// 错误密码测试
		boolean wrongPassword = BCrypt.checkpw("wrong123", storedHash);
		System.out.println("错误密码验证: " + wrongPassword); // false
	}

	@Autowired
	private SysUserMapper userMapper;

	@Test
	void testDbConnection() {
		System.out.println("----- 开始测试数据库连接 -----");

		// 1. 查一下所有用户
		List<SysUser> userList = userMapper.selectList(null);
		System.out.println("当前数据库用户数: " + userList.size());

		// 2. 试着插入一个测试用户
		SysUser newUser = new SysUser();
		newUser.setUsername("admin_test");
		newUser.setPassword("123456");
		newUser.setRealName("管理员大哥");
		newUser.setStatus(1);

		int result = userMapper.insert(newUser);
		System.out.println("插入结果(1表示成功): " + result);
		System.out.println("雪花算法生成的ID: " + newUser.getId()); // 看这里！ID应该是一个很长的数字

		System.out.println("----- 测试结束 -----");
	}

}
