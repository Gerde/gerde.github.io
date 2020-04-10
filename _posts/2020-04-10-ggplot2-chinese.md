---
layout: post
title: ggplot2中使用中文字体
date:   2020-04-10
---

列出Linux系统中的中文字体:

```
fc-list :lang=zh

/usr/share/fonts/opentype/adobe/simsun.ttc: 新宋体,NSimSun:style=Regular
/usr/share/fonts/opentype/adobe/simhei.ttf: 黑体,SimHei:style=Regular
/usr/share/fonts/opentype/adobe/AdobeHeitiStd-Regular.otf: Adobe 黑体 Std,Adobe Heiti Std,Adobe Heiti Std R,Adobe 黑体 Std R:style=R,Regular
/usr/share/fonts/opentype/adobe/simkai.ttf: 楷体_GB2312,KaiTi_GB2312:style=Regular
/usr/share/fonts/opentype/adobe/AdobeKaitiStd-Regular (v5.010).otf: Adobe 楷体 Std,Adobe Kaiti Std,Adobe Kaiti Std R,Adobe 楷体 Std R:style=R,Regular
/usr/share/fonts/otherttf/simhei.ttf: 黑体,SimHei:style=Regular
/usr/share/fonts/opentype/adobe/AdobeFangsongStd-Regular (v5.010).otf: Adobe 仿宋 Std,Adobe Fangsong Std,Adobe Fangsong Std R,Adobe 仿宋 Std R:style=R,Regular
/usr/share/fonts/opentype/adobe/simsun.ttc: 宋体,SimSun:style=Regular
/usr/share/fonts/opentype/adobe/AdobeSongStd-Light.otf: Adobe 宋体 Std,Adobe Song Std,Adobe Song Std L,Adobe 宋体 Std L:style=L,Regular
/usr/share/fonts/opentype/adobe/simfang.ttf: 仿宋_GB2312,FangSong_GB2312:style=Regular

```

使用showtext加载字体到R中：

```
library(showtext)
showtext_auto()
font.add('SimSun', regular = '/usr/share/fonts/opentype/adobe/simsun.ttc')
df <- data.frame(x = rnorm(100, mean = 10))
ggplot(df, aes(x)) + geom_density() + labs(x = '随机数') + theme(text = element_text(family = 'SimSum'))
```

![]({{site.baseurl}}/images/20200410-ggplot2-chinese.png)
