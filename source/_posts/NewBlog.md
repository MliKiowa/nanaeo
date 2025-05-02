---
title: 新博客建好啦
date: 2022-08-05
categories:
    - SiteLog
tags:
    - SiteLog
    - HexoThemes
    - Hexo
---
Hi Hexo,I am Mlikiowa!
是全新的Hexo/vlolantis博客,我又回来写博客了!
<!-- more -->
{% timeline %}
{% timenode 2019.Previous %}
使用过Emlog Wordpress来搭建博客，使用过各种博客系统，体验不能说差，只能说没有。
{% endtimenode %}
{% timenode 2019.Done %}
开始尝试在CSDN 简书平台发布自己的文章，但是后来因为咱不太喜欢平台限制，遂转入Typecho来搭建博客。
{% endtimenode %}
{% timenode 2020.Done %}
一开始typecho小而美的感觉是很不错的体验，加上我正好会使用PHP，能自己搓插件，所以体验还不错。
{% endtimenode %}
{% timenode 2021.Done %}
期间域名备案和准备高考，并搭建了一个运行在国内的typecho博客。
{% endtimenode %}
{% timenode 2022.Done  %}
上半年:因为没有空闲时间打理博客，备案因无法联系注销，后来意外将电脑中typecho的备份删除，故跑路。
下半年:借大佬之手找回了数据，但准备重新开始，于是依靠Hexo搭建了全新的博客，走上了白嫖之路。
{% endtimenode %}
{% endtimeline %}
## 回忆

* **事件前言:** 大家好呀，这里是我的新博客哦！之前经历了一些小波折，现在我决定用 Hexo 重新开始啦，通过 serverless 和 GitHub Actions 实现自动化部署，感觉自己棒棒哒！

* **备案历程:** 之前一直用 Typecho 嘛，服务器和域名都在国内备了案。那时候高中学业比较忙，每天都在学习，没太多时间打理博客。结果错过了备案审核的电话，备案就失效啦，呜呜。而且当时写的博文质量也不太好，就暂时放弃了。后来在朋友的帮助下找回了数据，不过我还是决定重新开始。

* **重启计划:** 2022 年下半年毕业后，终于有时间重新经营博客啦。本来打算继续用 Typecho 的，但是用起来发现有些地方不太顺手，所以就决定换个博客系统。

* **实际行动:** 最终选择了 Hexo 作为新的博客系统。这样不仅成本比较低，而且还很稳定。最重要的是，这个方案可以很方便地在不同设备之间迁移使用，不用担心博客再次“跑路”啦。

### 博客运行环境
{% table %}
| Name | Content |
| -------- | -------- |
| Blog | Hexo |
| Theme | volantis |
| platform | vercel＆Github |
| domain | 10snow.com |
{% endtable %}

* **小吐槽:** 之前还想试试`hexo-theme-diaspora`这个主题呢，
这款博客是从 wp 移植到 hexo 的，介绍图超级好看，可惜作者没有再更新了，所以我只能选择其他主题啦。
所以我换成了 **volantis** 主题 (`npm -i hexo-theme-volantis` 可以轻松安装)，个人感觉它的色调和布局都很好看，可玩性也很高。

## 博客搭建
{% link 本博客源码项目::https://github.com/MliKiowa/MliKiowa.github.io::https://q1.qlogo.cn/g?b=qq&nk=1627126029&s=100 %}
* 我的博客通过使用 Github Action 等方式生成部署博文到 github page、Vercel 等服务商。
至于推送到 `cos/oss .etc storage bucket` 就算啦，感觉谁用谁亏钱（容易被打，好一点的情况也得宕机）。

* **小提示:** 使用多服务商涉及到 DNS 分流，像腾讯 DNSPod 这种解析服务要交钱升级才能用，有点难受，所以我考虑用动态 API 来切换 DNS 解析。
* **小吐槽:** 居然 `github workflow` 只有现成的 `deploy hugo site to githubpage workflow`，没有 Hexo 自动部署的脚本，于是我就照猫画虎地写了一个 Hexo 自动部署脚本，但是因为技术太菜，用这个 workflow 还得改半天。
正当我吐槽这么大的 GitHub 没人发布自动部署脚本的时候，我在 GitHub 上搜到了类似的 workflow，但是我代码都写完了，难受。

## 迁移使用
* 本博客可以通过以下脚本快速迁移，从云端 Github 下载源码，然后在本地编写博文，提交后直接使用 action 刷新博客。（这个方法已经失效了哦）
* **Tips:** 如果你有需要，也可以执行以下脚本建立新博客，可以轻松地在新设备上运行。
{% folding bash.sh %}
```
git clone https://github.com/MliKiowa/nanaeo
cd MliKiowa.github.io
npm install
hexo g
```
{% endfolding %}

## 博客内容
{% table %}
| Classification | Content |
| ----------- | ----------- |
| Dev Exp | Free Developer |
| Site Log | Site Maintenance Log |
| Life Log | Record your life  |
{% endtable %}

* **小提示:** 内容主要以编程和生活为主，不会推荐资源，也不接受友链哦。

## 期盼
* **域名问题:** 原来的域名看起来有点憨憨的，还被**朋友嘲笑了**，所以觉得旧域名配不上我的新博客，就注册了一个更符合气质的新域名 10snow.com，寓意没有很特别啦，全凭感觉，可爱就对了嘛（歪头
* **跑路问题:** 折腾过好几次博客的我真的是太累了，所以这次博客能稳定 run 起来，我就不想再折腾新博客了。但是请允许我说一句，我正在努力成为年更博主！半年一更就是高产！
* **内容布局:** 还在摸索中，你现在看到的排版都是我正在尝试的，我很少用 Hexo，可以说是萌新一枚，但是我会慢慢完善的，应该没什么问题。
* **图床问题:** 这个问题我也不知道怎么解决，还是先摆烂吧，能不放图就不放图。