# Damon：SSM整合小Demo

## 技术准备

Java基础知识、简单的前端知识、Spring、Spring MVC、Mybatis、MySQL、IDEA、Maven

## 开发流程

### 需求分析

- 使用**数据库**来**保存数据**
- 能**增删改查**学生的信息*（学号，名称，年龄，性别，出生日期）*

### 表结构设计

**创建数据库：student**

```
DROP DATABASE IF EXISTS student;
CREATE DATABASE student DEFAULT CHARACTER SET utf8;
```

**创建学生表：student**

为什么不用学号做主键？业务字段可能涉及到修改，不适合做主键

```
CREATE TABLE student(
  id int(11) NOT NULL AUTO_INCREMENT,
  student_id int(11) NOT NULL UNIQUE,
  name varchar(255) NOT NULL,
  age int(11) NOT NULL,
  sex varchar(255) NOT NULL,
  birthday date DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
```

### 原型设计

主页面：用来做信息展示

编辑页面：用来提交修改信息

### SSM环境搭建

#### 创建Maven项目，选择webapp

#### 搭建目录结构

#### 配置文件内容

pom.xml、web.xml、spring-mybatis.xml、spring-mvc.xml、jdbc.properties、log4j.xml

#### 实体类设计

实体类仅仅是对数据库中表的一一映射（表中字段名应该和实体类中的名称一一对应）

bean下Student类

#### DAO类设计

设计DAO类同时创建好映射文件

#### 业务类设计

包括接口和实现类

- **问题：** 为什么不直接使用 Dao 类而是还要在上面封装一层 Service 层呢？

- 回答：
  基于责任分离的原则，Dao 层就应该专注于对数据库的操作，而在 Service 层我们可以增加一些非 CRUD 的方法去更好的完成本身抽离出来的 service 服务（业务处理）。

#### 功能开发

Contrller和页面

#### 分页功能

page工具类

listStudent请求

页面分页栏

