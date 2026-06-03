# Fix HTML entity encoding issues in source files
$filesToFix = @(
    "src\App.tsx",
    "src\components\Navbar.tsx",
    "src\components\Footer.tsx",
    "src\components\ProductCard.tsx",
    "src\components\TeamCard.tsx",
    "src\pages\Home.tsx",
    "src\pages\About.tsx",
    "src\pages\Contact.tsx",
    "src\pages\Login.tsx",
    "src\pages\Admin.tsx",
    "src\store\useAuthStore.ts",
    "src\hooks\useScrollAnimation.ts",
    "src\utils\validation.ts",
    "src\types\index.ts",
    "src\data\mockData.ts"
)

foreach ($file in $filesToFix) {
    if (Test-Path $file) {
        Write-Host "Fixing: $file"
        $content = Get-Content $file -Raw -Encoding UTF8
        $content = $content.Replace("&lt;", "<")
        $content = $content.Replace("&gt;", ">")
        $content = $content.Replace("&quot;", '"')
        $content = $content.Replace("&amp;", "&")
        Set-Content $file -Value $content -Encoding UTF8 -NoNewline
    } else {
        Write-Host "File not found: $file"
    }
}

Write-Host "Fix complete!"
