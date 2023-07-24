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

## 回忆

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

* **事件前言:** 各位好啊，以上就是我的悲剧经历了，现在我又新搭了博客，使用Hexo博客来进行搭建，依托serverless和action等工具实现。

* **备案悲剧:** 之前我一直使用typecho，服务器和域名在国内备案，高中学业繁忙，每天都忙着学习。
所以个人就没有时间处理相关的事情，审核电话我也没有接到，导致国内备案掉了，加上本来博文写的就不怎么样，后来干脆就直接删掉跑路了，虽然后面通过大佬进行找回了，我也是决定从头开始了。

* **计划上线:** 直到2022年的下半年毕业，我终于想起时修理博客，却又嫌折腾博客麻烦，国内备案审核挺烦。
本来是计划在另一位大佬那里使用Typecho搭建博客，因为typecho某些地方有些实在是难受，导致我实在是忍受不了痛苦了(恼，于是很快决定更换博客系统。

* **实际行动:** 于是我决定博客使用hexo搭建，并且以低成本实现搭个稳定的博客，
本博客是非常容易在新设备上使用，轻松可以在新的地方迁移使用，将跑路可能性降到最低了。
### 博客运行环境
{% table %}
| Name | Content |
| -------- | -------- |
| Blog | Hexo |
| Theme | volantis |
| platform | vercel＆Github |
| domain | nanaeo.cn |
{% endtable %}

* **小吐槽:** 之前还想试试`hexo-theme-diaspora`这样的主题，
这款博客是从wp移植到hexo的，介绍图很好看，可惜作者没更新了，于是我只能选择其它主题了。
所以我换成了**volantis**主题 (`npm -i hexo-theme-volantis` 可以轻松安装)，个人感觉色调和布局都很好看，可玩程度很高。

## 博客搭建
{% link 本博客源码项目::https://github.com/MliKiowa/MliKiowa.github.io::https://q1.qlogo.cn/g?b=qq&nk=1627126029&s=100 %}
* 本博客通过使用GithubAction等方式生成部署分发博文到如githubpage vercel等服务商
至于推送到`cos/oss .etc storage bucket`还是算了，毕竟谁用谁欠费(容易挨打，好点情况也得宕了)。

* **小提示:** 使用多服务商涉及到Dns分流，像腾讯Dnspod的这种解析服务要交钱升级才能使用，非常的难受，所以我考虑使用动态Api进行切换dns解析。
* **小吐槽:** 居然`github workflow`只有已经写好的`deploy hugo site to githubpage workflow`，没有hexo自动部署的脚步，于是我照猫画虎写了一个Hexo自动部署脚本，但因水平太菜，用这个workflow还得我改了半天。
正当我吐槽这么大个github没人发布自动部署脚本的时候，我在github search找到了类似的workflow，但是我已经写完了，难受。

## 迁移使用
* 本博客通过以下脚本可以快速迁移，从云端Github下载源码然后在本地进行编写博文,提交后直接在使用action刷新博客。 (该内容已经失效)
* **Tips:** 如果你有需要也可以执行以下脚本建立新博客，可以轻松在新设备上运行。
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
 * **小提示:** 内容的主要以编程和生活为主，不会有资源推荐，也不接受类似站点友链。
## 期盼
* **域名问题:** 原来的域名看起来好憨，还被**我朋友嘲笑了**，因此旧域名怎么能配得上新博客，所以我还是注册个符合气质的新域名啊，所以nanaeo.cn诞生了，寓意没有很特别，全凭感觉来，可爱就对了不是嘛(歪头
* **跑路问题:** 折腾数次各种博客的我真的是太累了，所以本博客能run起来我觉得不是不会去折腾什么新博客了，但是请允许我说一句，我正在努力成为年更博主吧，半年一更就是高产!
* **内容布局:** 咱正在正在摸索，你现在看到的排版全是我正在尝试的，我很少使用Hexo，可以说是全新的萌新，但是让我来慢慢完善应该没有任何问题。
* **图床问题:** 这个问题我根本不知道怎么解决我还是摆烂吧，博文能不放图我绝对不会放图出来。
* **总结一下:** 这就是Mlikiowa全新的博客了，Always believe that something wonderful is about to happen.Let's go!
