---
title: "丁香疫情数据查询Bot（非官方"
date: 2022-01-06T20:48:54+08:00
categories: []
tags: [Coding]
aliases: [/posts/nCovBot/]
description: 毕业设计：Telegram 的疫情机器人
---

## TODO


- [x] 全局概览
- [x] 优化图表
- [ ] 优化日志
- [ ] 定时任务错误处理


## 简介

一个[Telegram Covid-19 Bot](https://t.me/Dougaanbot) 定时缓存数据 渲染图表

![nCovBot](https://github.com/varz1/pics/blob/master/bot.png?raw=true)

## 第三方模块

- Http客户端 — [Resty](https://github.com/go-resty/resty)
- 前端 — [Telegram bot](https://github.com/go-telegram-bot-api/telegram-bot-api)
- 日志 — [Logrus](https://github.com/spf13/viper)
- 无头浏览器—[ChromeDp](https://github.com/chromedp/chromedp)
- net框架—[Fiber](https://github.com/gofiber/fiber)
- 后台渲图—[chart](https://github.com/vdobler/chart)

## 遇到的问题以及解决

- 无头浏览器无中文字体—添加字体文件
- tgbot使用缓存图片不更新—添加时间戳参数
- iding空转自动i休眠—cron自己ping自己
- Heroku Go依赖错误—生成Go的Vendor依赖文件

## 我的环境以及用到的服务
- Go 1.17
- Debian 10
- Telegram [Api](https://github.com/go-telegram-bot-api/telegram-bot-api)
- [Heroku](https://dashboard.heroku.com/apps)
- Telegram 客户端

## 开发及部署

### 目录结构
- bot—bot初始化以及路由
- Channel—全局channel
- data—网络客户端从Api获取数据以及无头浏览器
- maker—将数据处理成Tg的消息格式
- model—各种结构体
- public文件—个人主页
- list.json文件—由于支持地区较为固定这里直接保存成文件

### 关于getUpdates和setWebhook
官方文档解释机器人的两种接受消息的方法一个是轮询一个是Webhook，前者即机器人不断请求Api询问有无最新消息需要处理，后者即你的Webhook通知你的机器人有消息来了，前者胜在本地调试方便。后者胜在耗费资源少，处理消息快，也更优雅，但是webhook需要有服务器和证书条件，这里Heroku提供免费的使用额度。
### 如何使用webhook
#### 机器人部分
这里[官方文档](https://core.telegram.org/bots/api#setwebhook)有解释配置部分。简单说就是写一个网络客户端，开一个地址给Webhook，钩子接受到消息解析成Api里面Update再传递给机器人。

#### Heroku部分

到App的设置面板添加你的Webhook，注意与程序中的一致，建议为你的Heroku App的地址+你的机器人token，因为除了你自己没人知道。

### 部署

Heroku提供了自动部署，建议阅读使用文档。


## ChangeLog
- **2022.1.20** 全局概览
- **2022.1.16** 初始化数据,定时更新数据,风险地区优化
- **2022.1.15** 图表中文支持
- **2022.1.14** 使用文件传输图表,优化了定时器,初始化图表

## 数据以及图表来源

[丁香园](https://github.com/BlankerL/DXY-COVID-19-Data)
[腾讯](https://news.qq.com/zt2020/page/feiyan.htm#/)
[百度](https://voice.baidu.com/act/newpneumonia/newpneumonia)

## 参考项目及文档

[*煎蛋爬虫*](https://github.com/zigitn/jiandanBot)

[go-telegram-bot-api](https://github.com/go-telegram-bot-api)

[Marvin的Webhook奇妙指南](https://core.telegram.org/bots/webhooks)

[Tg Api](https://core.telegram.org/bots)