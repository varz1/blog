---
title: "Linux 桌面环境使用不完全指南"
date: 2021-10-16T23:12:59+08:00
categories: []
tags: [Linux]
aliases: [/posts/linux-desktop/]
description: "Debian + KDE Setup"
---

类Unix系统下的Shell对于开发者来说有多好用不用说，都懂。再者Linux的高度可定制也给了大家想象力的空间和编写以及使用脚本的环境。这里以debian为例给出安装配置过程。886 Windows

## 一.下载安装

### 1.下载

[清华软件镜像站](https://mirrors.tuna.tsinghua.edu.cn/)等

### 2.烧录至U盘

这里使用[Rufus](https://rufus.ie/zh/)工具进行烧录

### 3.安装

插上U盘，重启。电脑开机按F12进入BIOS界面，选择你的U盘设备，进入debian安装界面。

选择Graphics install图型界面安装，按照流程，这里我选择的桌面环境是KDE，再选上自己需要的环境，重启进入系统。

## 二.基本配置

### 1.添加当前用户进入管理员组

```bash
$ su    #进入root
$ chmod +w /etc/sudoers
$ sudo nano /etc/sudoers    #将当前用户加入root下面，后面一样
$ chmod +r /etc/sudoers
```

### 2.修改软件源

```bash
$ sudo nano /etc/apt/sources.list 
```

注释或删除掉内容，加入新的软件源，这里使用[清华大学镜像站软件源](https://mirrors.tuna.tsinghua.edu.cn/help/debian/)

由于我的软件包较旧，这里加入了https的软件源后出现了报错，将https改为http即可。

修改完将不需要的自带软件删除掉后，运行apt update和upgrade，更新结束后将http改回去https。

### 3.添加无线模块驱动

```bash
$ sudo apt update
$ sudo apt install firmware-iwlwifi
$ su -
$ modprobe -r iwlwifi
$ modprobe iwlwifi
```

### 4.安装基本软件

根据个人需要安装软件，vim/git/等。

### 5.开机自动挂载硬盘

```bash
$ sudo fdisk -l #找到需要挂载的硬盘的标志
$ sudo mount /dev/sda /media  # 后面的media是你要挂载的位置
$ sudo blkid # 记录下sda的UUID
$ sudo vim /etc/fstab #添加下列记录 UUID=xxxxxxxxxx   /media  ntfs    defaults        0       2 
```

### 6.安装中文输入法

个人习惯使用fcitx的google拼音，但是词库十分让人头疼，也可以尝试ibus。这里参考了这位博主详细的总结,[链接在此](https://blog.csdn.net/yanhanhui1/article/details/115128309)

### 7.安装配置代理服务器

这里使用[clash](https://github.com/Dreamacro/clash)，一个使用go写的代理。这里给出安装好后使用systemctl来自动控制的过程。

```bash
$ sudo vim /etc/systemd/system/clash.service
```

内容如下

```
[Unit]
Description=Clash service
After=network.target

[Service]
Type=simple
User=skylee
ExecStart=/usr/bin/clash
Restart=on-failure
RestartPreventExitStatus=23

[Install]
WantedBy=multi-user.target
```

user为用户名

```
$ sudo systemctl daemon-reload
$ sudo systemctl enable clash#开机自动启动
$ sudo systemctl start clash#开启服务
$ sudo systemctl status clash# 查询服务状态
```

## 三.个性化配置

### 1.添加DNS记录

发现无法访问dl.google和rawgithub等服务，添加下列记录到/etc/hosts

```
#git 
185.199.108.154               github.githubassets.com
140.82.113.22                 central.github.com
185.199.108.133               desktop.githubusercontent.com
185.199.108.153               assets-cdn.github.com
185.199.108.133               camo.githubusercontent.com
185.199.108.133               github.map.fastly.net
199.232.69.194                github.global.ssl.fastly.net
192.30.253.113                gist.github.com
185.199.108.153               github.io
140.82.114.4                  github.com
140.82.113.5                  api.github.com
185.199.108.133               raw.githubusercontent.com
185.199.108.133               user-images.githubusercontent.com
185.199.108.133               favicons.githubusercontent.com
185.199.108.133               avatars5.githubusercontent.com
185.199.108.133               avatars4.githubusercontent.com
185.199.108.133               avatars3.githubusercontent.com
185.199.108.133               avatars2.githubusercontent.com
185.199.108.133               avatars1.githubusercontent.com
185.199.108.133               avatars0.githubusercontent.com
185.199.108.133               avatars.githubusercontent.com
140.82.112.10                 codeload.github.com
52.216.104.59                 github-cloud.s3.amazonaws.com
52.216.164.131                github-com.s3.amazonaws.com
52.216.29.28                  github-production-release-asset-2e65be.s3.amazonaws.com
52.217.81.140                 github-production-user-asset-6210df.s3.amazonaws.com
52.217.80.164                 github-production-repository-file-5c1aeb.s3.amazonaws.com
185.199.108.153               githubstatus.com
64.71.168.201                 github.community
185.199.108.133               media.githubusercontent.com
#google
203.208.41.78 dl.google.com
```

也可以自行搜索。

### 2.安装配置shell

debian默认的shell是bash，这里安装配置zsh,配置[ohmyzsh](https://github.com/robbyrussell/oh-my-zsh)，就可以自行diy自己的shell啦

```bash
$ sudo apt install zsh #安装
$ chsh -s /bin/zsh# 设置为默认shell
$ sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# 使用ohmyzsh的脚本安装
```

shell的自动补全插件这里使用了incr

### 3.安装主题

- 图标包推荐[papirus](https://launchpad.net/~papirus/+archive/ubuntu/papirus/+packages?field.name_filter=papirus-icon-theme)
- 主题推荐[material kde](https://store.kde.org/p/1229134)

### 4.安装dock

linux下的dock个人还是最喜欢latte-dock

```bash
$ sudo apt install latte-dock #通过shell运行，重启后就可以自动自启动
```

### 5.安装Spotify

想在linux下听歌？想要更好体验？没有比spotify能打的。安装配置参考本人之前的[文章](https://varz1.github.io/posts/spotify/)

### 6.夜间模式

Linux也有夜间模式啦，使用redshift效果不输ios，详细配置[参考文章](https://zhuanlan.zhihu.com/p/34562682)

结束！
![Linux](https://raw.githubusercontent.com/varz1/pics/refs/heads/master/spotify.png)


## 四.常见问题及解决

### 1.由于没有公钥，无法验证下列签名

常常使用ppa添加完软件源后出现这样的问题，解决方法是添加提示的key导入公钥

```bash
$ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys YOURKEY
```

## 五.Todo

- [ ]  更好的备份方案