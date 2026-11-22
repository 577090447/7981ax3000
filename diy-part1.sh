#!/bin/bash

rm -rf package/OpenAppFilter
rm -rf package/luci-app-store
rm -rf package/luci-app-gecoosac
rm -rf package/luci-app-harbor-file
rm -rf package/luci-app-tcpdump
rm -rf package/luci-theme-argon
rm -rf package/luci-app-argon-config
rm -rf package/luci-theme-vantage
rm -rf package/luci-app-vantage
rm -rf package/luci-theme-footstrap
# 清理carbon旧目录，防止残留
rm -rf package/luci-theme-carbon

# 添加 istore 软件源到 feeds.conf.default
grep -q "src-git istore" feeds.conf.default || \
echo 'src-git istore https://github.com/linkease/istore;main' >> feeds.conf.default

# 添加 carbon主题源写入 feeds.conf.default
grep -q "src-git carbon" feeds.conf.default || \
echo 'src-git carbon https://github.com/guangyin53222/luci-theme-carbon.git' >> feeds.conf.default

# 克隆第三方插件
git clone --depth=1 https://github.com/destan19/OpenAppFilter package/OpenAppFilter
git clone --depth=1 https://github.com/destan19/luci-app-harbor-file package/luci-app-harbor-file
git clone --depth=1 https://github.com/laipeng668/luci-app-gecoosac package/luci-app-gecoosac
git clone --depth=1 https://github.com/KFERMercer/luci-app-tcpdump.git package/luci-app-tcpdump
git clone --depth=1 https://github.com/anothaDev/luci-theme-vantage package/luci-theme-vantage
git clone --depth=1 https://github.com/eamonxg/luci-theme-aurora package/luci-theme-aurora

echo "diy-part1.sh done."
