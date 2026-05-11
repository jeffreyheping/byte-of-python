#!/bin/bash
# ============================================================
# 差异对比脚本 - 用于同步上游更新后，对比英文原版和中文翻译
# 用法: bash diff_check.sh [文件名]
#   例如: bash diff_check.sh basics.md
#   如果不指定文件名，则对比所有 .md 文件
# ============================================================

EN_DIR="en"
ZH_DIR="zh-cn"

if [ ! -d "$EN_DIR" ] || [ ! -d "$ZH_DIR" ]; then
    echo "❌ 错误：找不到 en/ 或 zh-cn/ 目录"
    echo "   请在项目根目录下运行此脚本"
    exit 1
fi

echo "================================================"
echo "  《A Byte of Python》中英文差异对比工具"
echo "================================================"
echo ""

if [ -n "$1" ]; then
    # 对比指定文件
    FILE="$1"
    if [ ! -f "$EN_DIR/$FILE" ]; then
        echo "❌ 错误：找不到英文文件 en/$FILE"
        exit 1
    fi
    if [ ! -f "$ZH_DIR/$FILE" ]; then
        echo "⚠️  提示：找不到中文文件 zh-cn/$FILE，该文件尚未翻译"
        echo ""
        echo "英文文件内容："
        wc -l "$EN_DIR/$FILE"
        exit 0
    fi
    echo "📄 对比文件: $FILE"
    echo "   英文: $EN_DIR/$FILE ($(wc -l < "$EN_DIR/$FILE") 行)"
    echo "   中文: $ZH_DIR/$FILE ($(wc -l < "$ZH_DIR/$FILE") 行)"
    echo ""
    echo "================================================"
    diff --unified=3 "$EN_DIR/$FILE" "$ZH_DIR/$FILE" || true
else
    # 对比所有 .md 文件
    echo "📊 对比所有 Markdown 文件..."
    echo ""

    TOTAL_EN=0
    TOTAL_ZH=0
    DIFF_COUNT=0
    MISSING_COUNT=0

    for FILE in "$EN_DIR"/*.md; do
        BASENAME=$(basename "$FILE")

        if [ ! -f "$ZH_DIR/$BASENAME" ]; then
            echo "❌ 缺少翻译: $BASENAME"
            MISSING_COUNT=$((MISSING_COUNT + 1))
            continue
        fi

        EN_LINES=$(wc -l < "$EN_DIR/$BASENAME")
        ZH_LINES=$(wc -l < "$ZH_DIR/$BASENAME")
        TOTAL_EN=$((TOTAL_EN + EN_LINES))
        TOTAL_ZH=$((TOTAL_ZH + ZH_LINES))

        # 检查是否有差异（忽略空白差异）
        if ! diff --brief --ignore-all-space "$EN_DIR/$BASENAME" "$ZH_DIR/$BASENAME" > /dev/null 2>&1; then
            echo "📝 有差异: $BASENAME (英文 ${EN_LINES} 行 / 中文 ${ZH_LINES} 行)"
            DIFF_COUNT=$((DIFF_COUNT + 1))
        else
            echo "✅ 一致:   $BASENAME (${EN_LINES} 行)"
        fi
    done

    echo ""
    echo "================================================"
    echo "  📊 统计摘要"
    echo "================================================"
    echo "  英文总行数: $TOTAL_EN"
    echo "  中文总行数: $TOTAL_ZH"
    echo "  有差异文件: $DIFF_COUNT 个"
    echo "  缺少翻译:   $MISSING_COUNT 个"
    echo ""
    echo "💡 提示：使用 'bash diff_check.sh <文件名>' 查看具体差异"
    echo "   例如: bash diff_check.sh basics.md"
fi
