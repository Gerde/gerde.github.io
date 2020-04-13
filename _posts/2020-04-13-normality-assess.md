---
layout: post
title: STHDA 数据正态性检验
date:   2020-04-13
---

```
STHDA系列学习笔记, http://www.sthda.com/english
```

统计学检验中，很多参数检验要求数据服从正态分布，所以在使用此类检验之前必须对数据进行正态性检验。通常可以使用作图法或显著性检验法，或结合使用：

### 作图法

* 使用直方图或密度分布图：

```r
library(ggplot2)
library(patchwork)

set.seed(123)
df <- data.frame(x = rnorm(1000, mean = 5))
p1 <- ggplot(df, aes(x)) + geom_histogram() + theme_bw()
p2 <- ggplot(df, aes(x)) + geom_density() + theme_bw()
p1 / p2

```

![]({{site.baseurl}}/images/visual_plot_20200413.png)

* 使用Q-Q plot:

```r
library(ggplot2)

set.seed(123)
df <- data.frame(x = rnorm(1000, mean = 5))
ggplot(df, aes(x)) + geom_qq() + geom_qq_line() + theme_bw()

```

![]({{site.baseurl}}/images/qqplot_20200413.png)

### 显著性检验法

使用Shapiro-Wilk's test进行正态性检验，如果p < 0.05，则可以认为数据不符合正态分布:

```r
set.seed(123)
dt <- rnorm(1000, mean = 5)
shapiro.test(dt)

```

Shapiro-Wilk normality test

data:  dt

W = 0.99838, p-value = 0.4765

p = 0.4765, 统计不显著，即该数据服从正态分布。

```
根据中心极限定理，数据点大于30个时，可以忽略数据的正态性，直接使用参数检验。
```
