# =============================================================================
# setup-mac15.ps1
# One-command clone + automatic download of mac15.qcow2 into mac15-image/
# =============================================================================

$ErrorActionPreference = "Stop"

$GitHubRepo = "https://github.com/nullvoider07/mac15-base"
$RepoName   = "mac15-base"

Write-Host "🚀 Cloning GitHub repo: $GitHubRepo" -ForegroundColor Cyan

# ----------------------------- Clone with GitHub CLI -----------------------
Write-Host "🔧 Checking GitHub CLI..."

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Host "   GitHub CLI not found. Installing via winget..."
    
    # Install gh silently, accepting agreements automatically
    winget install --id GitHub.cli --exact --accept-source-agreements --accept-package-agreements
    
    # Refresh the PATH variables in the current session so 'gh' is recognized immediately
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
    
    # Verify installation succeeded
    if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
        throw "❌ Failed to install GitHub CLI automatically. Please install it manually from https://cli.github.com"
    }
    Write-Host "   ✅ GitHub CLI installed successfully."
} else {
    Write-Host "   ✅ GitHub CLI already available."
}

gh repo clone $GithubRepo $RepoName -- --depth=1

# ----------------------------- Ensure uv is available ---------------------
Write-Host "🔧 Checking uv..."

if (Get-Command uv -ErrorAction SilentlyContinue) {
    Write-Host "   uv already available — skipping installation."
} else {
    Write-Host "   Installing uv package manager..."
    Invoke-RestMethod -Uri https://astral.sh/uv/install.ps1 | Invoke-Expression
    $env:Path += ";$HOME\.cargo\bin;$HOME\.local\bin"
}

# ----------------------------- Ephemeral venv for huggingface-cli ----------
Write-Host "🔧 Creating ephemeral venv for huggingface-cli..."

$TempDir = [System.IO.Path]::GetTempPath()
$HfVenv = Join-Path $TempDir "hf-venv-$(New-Guid)"

# uv venv picks the correct current Python automatically
uv venv $HfVenv --quiet

# Install directly into the venv — no --system, no activation needed
uv pip install --python "$HfVenv\Scripts\python.exe" transformers --quiet

Write-Host "   ✅ huggingface-hub installed in ephemeral venv."

# ----------------------------- Download QCOW2 ------------------------------
Write-Host "📥 Downloading mac15.qcow2 (large file) into $RepoName\mac15-image\ ..."
Write-Host "    (This may take a while — progress bar will show)"

# Call huggingface-cli directly by its venv path — no PATH lookup, no cache
& "$HfVenv\Scripts\hf.exe" download NullVoider/mac15-base mac15.qcow2 --local-dir $ImagePath

# ----------------------------- Cleanup venv --------------------------------
Write-Host "🧹 Cleaning up ephemeral venv..."
Remove-Item -Recurse -Force $HfVenv

# ----------------------------- Final message -------------------------------
Write-Host ""
Write-Host "✅ SUCCESS!" -ForegroundColor Green
Write-Host "   Repository cloned → $RepoName\" 
Write-Host "   QCOW2 image ready at: $DownloadDir\mac15.qcow2"
Write-Host ""
Write-Host "   Next time just run: cd $RepoName && git pull" -ForegroundColor Gray