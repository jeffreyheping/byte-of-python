# 从上游同步 en/ 目录
# 用法: 右键点击此文件 -> 使用 PowerShell 运行

param(
    [switch]$Auto  # 添加 -Auto 参数自动执行并提交
)

$git = 'C:\Program Files\Git\bin\git.exe'
$repo = 'C:\Users\jeffr\Documents\GitHub\byte-of-python'

Write-Host "========================================"
Write-Host "从上游同步 en/ 目录"
Write-Host "上游: https://github.com/swaroopch/byte-of-python"
Write-Host "========================================"
Write-Host ""

# 1. 获取上游最新代码
Write-Host "[1/4] 获取上游最新代码..."
& $git -C $repo fetch upstream
Write-Host ""

# 2. 列出需要同步的文件
Write-Host "[2/4] 识别上游英文文件..."
$upstreamFiles = & $git -C $repo ls-tree upstream/master --name-only | Where-Object { $_ -match '\.md$' }
$fileCount = ($upstreamFiles | Measure-Object).Count
Write-Host "找到 $fileCount 个 .md 文件"
Write-Host ""

# 3. 同步文件到 en/
Write-Host "[3/4] 同步到 en/ 目录..."
$count = 0
foreach ($file in $upstreamFiles) {
    $destPath = Join-Path (Join-Path $repo 'en') $file
    $content = & $git -C $repo show "upstream/master:$file"
    $content | Out-File -FilePath $destPath -Encoding UTF8
    Write-Host "  同步: $file" -ForegroundColor Green
    $count++
}

# 同步 book.json
$content = & $git -C $repo show 'upstream/master:book.json'
$content | Out-File -FilePath (Join-Path $repo 'en\book.json') -Encoding UTF8
Write-Host "  同步: book.json" -ForegroundColor Green

Write-Host ""
Write-Host "[4/4] 完成! 共同步 $($count + 1) 个文件"
Write-Host ""

# 显示变更统计
Write-Host "========================================"
Write-Host "变更统计:"
Write-Host "========================================"
& $git -C $repo status en/ --short
Write-Host ""

# 如果指定了 -Auto 参数,自动提交并推送
if ($Auto) {
    Write-Host "========================================"
    Write-Host "自动提交并推送..."
    Write-Host "========================================"
    
    & $git -C $repo config user.email "sync@local"
    & $git -C $repo config user.name "Auto Sync"
    
    & $git -C $repo add en/
    & $git -C $repo commit -m "同步上游最新英文文件

同步日期: $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
    
    & $git -C $repo push origin master
    
    Write-Host ""
    Write-Host "已完成提交并推送!" -ForegroundColor Green
}
else {
    Write-Host "========================================"
    Write-Host "如需自动提交,请运行:"
    Write-Host "  .\sync_en.ps1 -Auto"
    Write-Host "========================================"
}
