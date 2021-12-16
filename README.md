# 背景

    2021年12 月 10 日凌晨，Apache 开源项目 Log4j 的远程代码执行漏洞细节被公开，由于 Log4j 的广泛使用，该漏洞一旦被攻击者利用会造成严重危害。据截止目前的信息，Apache Log4j 2.x < 2.15.0-rc2 版本均会受到影响。此次漏洞在日志框架层面可以被利用的前提是 Logger 打印日志的输入内容中有来自外部可控制的输入数据，如浏览器UA、Cookie、请求参数、对外API接口参数等可由外部用户控制的数据；
    针对改漏洞PerfMa内部产品提供此脚本升级客户环境log4j版本为官方提供log4j-api-2.16.0.jar版本，适用V3产品集：http://xfiregod.perfma-inc.com/ui/productSet/detail/201

# BugFix

    记录一些通用的漏洞修复

# 使用文档

    https://perfmahz.yuque.com/oar85r/igvafu/gliogq/edit

