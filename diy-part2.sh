#!/bin/bash
#
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Target: immortalwrt-mt798x-rebase @ 25.12
#

# ===================== 修改默认 IP → 192.168.100.1 =====================
sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/files/bin/config_generate

# ===================== 修改主机名 =====================
sed -i 's/ImmortalWrt/ARWRT/g' package/base-files/files/bin/config_generate

# ===================== 默认主题：Footstrap（Argon 已整组移除） =====================
mkdir -p package/base-files/files/etc/uci-defaults
cat << 'EOF' > package/base-files/files/etc/uci-defaults/99-default-theme
#!/bin/sh
uci set luci.main.mediaurlbase='/luci-static/footstrap'
uci commit luci
exit 0
EOF
chmod +x package/base-files/files/etc/uci-defaults/99-default-theme

# ===================== OpenClash 依赖处理：禁用 Rust 与 Ruby YJIT，防止 OOM =====================
sed -i 's/^CONFIG_PACKAGE_rust=y/# CONFIG_PACKAGE_rust is not set/' .config
sed -i 's/^CONFIG_PACKAGE_librust=y/# CONFIG_PACKAGE_librust is not set/' .config
sed -i 's/^CONFIG_RUBY_ENABLE_YJIT=y/# CONFIG_RUBY_ENABLE_YJIT is not set/' .config
echo '# CONFIG_PACKAGE_rust is not set' >> .config

# ===================== OpenClash 强制 binary core =====================
sed -i 's/^CONFIG_OPENCLASH_CORE_TYPE=.*/CONFIG_OPENCLASH_CORE_TYPE="binary"/' .config

# ===================== 清理 Rust 残留缓存 =====================
rm -rf dl/rustc-* dl/cargo-* 2>/dev/null || true

# ===================== 关键：清除同名 defconfig，避免干扰 make defconfig 目标 =====================
rm -rf defconfig

echo "diy-part2.sh done."
