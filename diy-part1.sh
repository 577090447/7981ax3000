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

grep -q "src-git istore" feeds.conf.default || \
echo 'src-git istore https://github.com/linkease/istore;main' >> feeds.conf.default

git clone --depth=1 https://github.com/destan19/OpenAppFilter package/OpenAppFilter
git clone --depth=1 https://github.com/destan19/luci-app-harbor-file package/luci-app-harbor-file
git clone --depth=1 https://github.com/laipeng668/luci-app-gecoosac package/luci-app-gecoosac
git clone --depth=1 https://github.com/KFERMercer/luci-app-tcpdump.git package/luci-app-tcpdump
git clone --depth=1 https://github.com/anothaDev/luci-theme-vantage package/luci-theme-vantage
git clone --depth=1 https://github.com/eamonxg/luci-theme-aurora package/luci-theme-aurora

echo "diy-part1.sh done."
