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


	/**
	 * 题干描述：
	 * 编写一个 Java 方法 countCharOccurrences，满足以下要求：
	 * 方法参数：
	 * 第一个参数：String input（待处理的输入字符串，可能为 null 或空字符串）
	 * 第二个参数：char target（需要统计出现次数的目标字符）
	 * 第三个参数：boolean ignoreCase（是否忽略大小写，true 表示忽略，false 表示严格匹配）
	 * 方法返回值：int（目标字符在输入字符串中的出现次数，若输入为 null 或空则返回 0）
	 * 特殊情况处理：
	 * 若输入字符串为 null 或长度为 0，直接返回 0；
	 * 忽略大小写时，需同时匹配目标字符的大写和小写形式（例如 target 为 'a'，ignoreCase 为 true 时，统计 'a' 和 'A' 的总次数）；
	 * 严格匹配时，需区分大小写（例如 target 为 'a'，仅统计 'a'，不统计 'A'）。
	 * @param input
	 * @param target
	 * @return
	 */
	int countCharOccurrences(String input, char target, boolean ignoreCase) {
		// 问题1修复：先处理边界条件（null/空字符串直接返回0）
		if (input == null || input.isEmpty()) {
			return 0;
		}

		int count = 0;
		// 问题2修复：忽略大小写时，先把target统一转小写/大写
		char targetNormalized = ignoreCase ? Character.toLowerCase(target) : target;

		for (char currentChar : input.toCharArray()) {
			char currentNormalized = currentChar;
			// 忽略大小写时，当前字符也统一转小写
			if (ignoreCase) {
				currentNormalized = Character.toLowerCase(currentChar);
			}
			// 统一比较归一化后的字符
			if (currentNormalized == targetNormalized) {
				count++;
			}
		}
		return count;
	}

	@Test
	void test() {
		int i = this.countCharOccurrences("AaBcAAA,sd", 'a', true);
		System.out.println(i);
	}

}
