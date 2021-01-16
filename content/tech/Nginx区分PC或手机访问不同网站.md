---
title: "Nginx区分PC或手机访问不同网站"
date: 2021-01-11T12:06:40+08:00
draft: true
tags: [Nginx]
---

# 简单的服务器端实现方法
有两套网站代码，一套PC版放在/usr/local/website/web，一套移动版放在/usr/local/website/mobile。只需要修改nginx的配置文件件，nginx通过UA来判断是否来自移动端访问，实现不同的客户端访问不同内容。
这种方法的缺点是移动端和PC端用同一个域名，存在黑帽的嫌疑，而且UA并不是总是判断的准确，如果判断错误的情况下，用户不能手动修改访问的网站类型。
关键的Nginx配置如下：
```
location / {
	#默认PC端访问内容
    root /usr/local/website/web;
 
	#如果是手机移动端访问内容
    if ( $http_user_agent ~ "(MIDP)|(WAP)|(UP.Browser)|(Smartphone)|(Obigo)|(Mobile)|(AU.Browser)|(wxd.Mms)|(WxdB.Browser)|(CLDC)|(UP.Link)|(KM.Browser)|(UCWEB)|(SEMC-Browser)|(Mini)|(Symbian)|(Palm)|(Nokia)|(Panasonic)|(MOT-)|(SonyEricsson)|(NEC-)|(Alcatel)|(Ericsson)|(BENQ)|(BenQ)|(Amoisonic)|(Amoi-)|(Capitel)|(PHILIPS)|(SAMSUNG)|(Lenovo)|(Mitsu)|(Motorola)|(SHARP)|(WAPPER)|(LG-)|(LG/)|(EG900)|(CECT)|(Compal)|(kejian)|(Bird)|(BIRD)|(G900/V1.0)|(Arima)|(CTL)|(TDG)|(Daxian)|(DAXIAN)|(DBTEL)|(Eastcom)|(EASTCOM)|(PANTECH)|(Dopod)|(Haier)|(HAIER)|(KONKA)|(KEJIAN)|(LENOVO)|(Soutec)|(SOUTEC)|(SAGEM)|(SEC-)|(SED-)|(EMOL-)|(INNO55)|(ZTE)|(iPhone)|(Android)|(Windows CE)|(Wget)|(Java)|(curl)|(Opera)" )
	{
		root /usr/local/website/mobile;
	}
 
	index index.html index.htm;
}
```