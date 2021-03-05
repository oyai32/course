# 精品课程网（javaWeb）

> 此项目为本人2015年的毕业设计，含展示页+后台管理系统。用最基础的servlet+jsp+mysql写的，技术老了，但很完整。整个项目的页面设计、功能设计、开发皆由本人一人完成，特此一份。

> 文末附上开题报告+论文，供大家参考，别忘了点star哦！

![image](https://github.com/oyai32/course/blob/master/viewImg/index.png)

![image](https://github.com/oyai32/course/blob/master/viewImg/coursecenter.png)

![image](https://github.com/oyai32/course/blob/master/viewImg/test.png)

## 功能列表
登录注册

在线出题

在线测试

资料下载

师生互动

我的作业

收取作业

用户管理

公告管理

## 目录说明
>展示页和后台管理页都写在了一个工程里

>大家可以直接拿源码改造，虽然用了jstl标签，但也用了ajax，要改成html也不难。

sql文件夹：该项目的sql都在这里啦，直接运行即可

src文件夹：java源码和数据库配置

webRoot文件夹：css、js、jsp

webRoot->backstage 文件夹：后台管理系统的页面

imgView文件夹：可以忽略，仅用于展示

课程网.artx：我是用Artisteer设计的首页，此为设计原件


## 预览说明
>webRoot->WEB-INF文件夹下有编译后的class文件，可以直接拿来webRoot运行看效果
### 操作步骤
1、在mysql数据库中运行文件下的 "sql.text"  建表（已提供测试数据）

2、更改数据库配置: course\WEB-INF\classes\database.properties

3、在tomcat的webapps中，新建一个course文件夹（最终访问路径的名称）

4、将course\WebRoot下的所有文件，复制到course下

5、开启tomcat，点击 tomcat\bin\startup.bat

### 首页入口：
localhost:8080/course/index.jsp  （8080为tomcat的端口号）

>测试登录帐号： 
>学生：student/123456
>老师：teacher/123456 
### 后台管理入口：
localhost:8080/course/backindex.jsp

>测试登录帐号：
>admin/admin

### 论文地址
开题报告：https://pan.baidu.com/s/1DqXVvKgSf_kf1V2kWKE6SA   (提取码：nvay) 

毕业论文：https://pan.baidu.com/s/1x8ESJH2qWFep9XLU4ezaug   (提取码：9a0z)
