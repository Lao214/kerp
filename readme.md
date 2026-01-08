# KERP - ERP库存管理系统

KERP是一个基于Spring Boot开发的现代化ERP库存管理系统，提供完整的采购、销售、库存和财务管理功能。

## 🌟 项目特点

- **模块化设计**：采用分层架构，各模块职责明确，便于维护和扩展
- **权限管理**：基于Sa-Token实现的完整权限控制体系
- **工作流引擎**：集成Flowable实现采购和销售订单的审批流程
- **实时通信**：支持WebSocket实现实时数据推送
- **Excel处理**：集成EasyExcel实现数据的导入导出
- **分布式支持**：使用Redis缓存和雪花算法ID生成器
- **逻辑删除**：实现数据的软删除功能

## 🛠️ 技术栈

| 技术 | 版本 | 用途 |
|------|------|------|
| Spring Boot | 3.1.7 | 应用框架 |
| Java | 17 | 开发语言 |
| MyBatis-Plus | 3.5.7 | ORM框架 |
| MySQL | 8.0.33 | 数据库 |
| Sa-Token | 1.37.0 | 权限认证 |
| Redis | - | 缓存和分布式锁 |
| Redisson | 3.24.0 | Redis客户端 |
| Flowable | 7.0.0 | 工作流引擎 |
| WebSocket | - | 实时通信 |
| Hutool | 5.8.25 | 工具库 |
| EasyExcel | 3.3.2 | Excel处理 |
| Lombok | - | 代码简化 |

## 📦 项目结构

```
kerp/
├── .mvn/                    # Maven包装器
├── src/                     # 源代码目录
│   ├── main/                # 主代码
│   │   ├── java/            # Java代码
│   │   │   └── com/         # 包根目录
│   │   │       └── example/ # 示例包
│   │   │           └── kerp/ # 项目根包
│   │   │               ├── common/      # 公共模块
│   │   │               │   ├── annotation/  # 自定义注解
│   │   │               │   ├── api/        # API相关
│   │   │               │   ├── aspect/     # 切面
│   │   │               │   ├── config/     # 配置
│   │   │               │   ├── entity/     # 实体基类
│   │   │               │   ├── exception/  # 异常处理
│   │   │               │   └── listener/   # 监听器
│   │   │               ├── config/        # 全局配置
│   │   │               ├── modules/       # 业务模块
│   │   │               │   ├── basic/     # 基础数据管理
│   │   │               │   ├── finance/   # 财务管理
│   │   │               │   ├── psi/       # 采购销售库存管理
│   │   │               │   └── system/    # 系统管理
│   │   │               └── KerpApplication.java # 应用入口
│   │   └── resources/       # 资源文件
│   │       ├── mapper/      # MyBatis映射文件
│   │       ├── processes/   # Flowable流程文件
│   │       └── application.yml # 应用配置
│   └── test/                 # 测试代码
├── .gitattributes            # Git属性配置
├── .gitignore                # Git忽略配置
├── dump-kerp-202601081143.sql # 数据库备份文件
├── mvnw                     # Maven包装器脚本(Linux)
├── mvnw.cmd                 # Maven包装器脚本(Windows)
├── pom.xml                  # Maven项目配置
└── README.md                # 项目说明文档
```

## 📋 功能模块

### 1. 系统管理 (system)
- 用户管理：用户信息维护、密码重置
- 角色管理：角色权限分配
- 菜单管理：系统菜单配置
- 部门管理：组织架构维护
- 认证管理：用户登录、令牌管理

### 2. 基础数据管理 (basic)
- 客户管理：客户信息维护
- 产品管理：产品信息维护、Excel导入
- 供应商管理：供应商信息维护
- 仓库管理：仓库信息维护

### 3. 采购销售库存管理 (psi)
- 采购订单：采购订单的创建、审批、管理
- 销售订单：销售订单的创建、审批、管理
- 库存管理：库存查询、库存变动记录
- 销售退货：销售退货单管理
- 报表统计：库存报表、销售报表等

### 4. 财务管理 (finance)
- 收款管理：收款单记录
- 付款管理：付款单记录

## 🚀 快速开始

### 1. 环境要求

- JDK 17+
- MySQL 8.0+
- Redis 6.0+
- Maven 3.6+

### 2. 安装步骤

#### 2.1 克隆项目
```bash
git clone <项目地址>
cd kerp
```

#### 2.2 配置数据库

1. 创建数据库：
```sql
CREATE DATABASE IF NOT EXISTS kerp CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

2. 导入数据库备份：
```bash
mysql -u root -p kerp < dump-kerp-202601081143.sql
```

#### 2.3 配置应用

修改 `src/main/resources/application.yml` 文件：

```yaml
# 数据库配置
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/kerp?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true
    username: root  # 你的MySQL用户名
    password: root1234  # 你的MySQL密码

# Redis配置
spring:
  data:
    redis:
      host: localhost
      port: 6379
      password:  # 如果有密码请填写
```

#### 2.4 启动项目

使用Maven启动：
```bash
./mvnw spring-boot:run
```

或打包后运行：
```bash
./mvnw clean package
java -jar target/kerp-0.0.1-SNAPSHOT.jar
```

项目将在 `http://localhost:8727` 启动

## ⚙️ 配置说明

### 核心配置

| 配置项 | 说明 | 默认值 |
|-------|------|--------|
| server.port | 服务端口 | 8727 |
| spring.datasource | 数据库连接配置 | - |
| spring.data.redis | Redis连接配置 | - |
| mybatis-plus.mapper-locations | MyBatis映射文件位置 | classpath*:mapper/**/*.xml |
| mybatis-plus.type-aliases-package | 实体类扫描包 | com.example.kerp.**.entity |
| sa-token.token-name | Token名称 | kerp-token |
| sa-token.timeout | Token有效期 | 2592000秒(30天) |
| flowable.check-process-definitions | 是否自动部署流程文件 | true |

### 工作流配置

工作流文件位于 `src/main/resources/processes/` 目录下：
- `purchase_audit.bpmn20.xml`：采购订单审批流程
- `sales_audit.bpmn20.xml`：销售订单审批流程

## 📝 API文档

项目集成了Swagger文档，启动项目后可访问：
```
http://localhost:8727/swagger-ui.html
```

## 🤝 贡献指南

1. Fork 本项目
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 打开 Pull Request

## 📄 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情

## 📧 联系方式

如有问题或建议，请通过以下方式联系：

- 项目地址：<项目GitHub地址>
- 邮箱：<维护者邮箱>

---

**KERP** - 让ERP管理更简单！