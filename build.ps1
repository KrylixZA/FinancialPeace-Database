param (
    $BuildVersion = "1.0.0.0",
    $BuildConfiguration = "Release"
)

# Declare directories
$workingDir = $PSScriptRoot;
$buildDir = Join-Path $workingDir "build";
$srcDir = Join-Path $workingDir "src";
$outputDir = Join-Path $workingDir "artifacts";
$distOutputDir = Join-Path $outputDir "dist";

# Cleanup build directories
$cleanupDirectories = @();
$cleanupDirectories += $outputDir;
$cleanupDirectories += (Get-ChildItem -Path $srcDir -Include ("bin", "obj") -Recurse).FullName;
foreach ($cleanupDir in $cleanupDirectories) {
    if (-not([string]::IsNullOrWhiteSpace($cleanupDirectories) -or [string]::IsNullOrEmpty($cleanupDir))) {
        if (Test-Path -Path $cleanupDir) {
            Remove-Item -Path $cleanupDir -Force -Recurse | Out-Null;
        }
    }
}

# Package the APIs
$nuspecFiles = (Get-ChildItem -Path $buildDir -Include ("*.nuspec") -Recurse).FullName;
foreach ($nuspecFile in $nuspecFiles) {
    $packCmd = "nuget pack $($nuspecFile) -NoPackageAnalysis -OutputDirectory `"$distOutputDir`" -BasePath $($workingDir) -Version $BuildVersion -Properties 'Configuration=$BuildConfiguration;Version=`"$BuildVersion`"'";
    # $packCmd = "dotnet pack `"$srcDir`" -p:NuspecFile=`"$nuspecFile`" --output `"$distOutputDir`" --configuration $BuildConfiguration /p:PackageVersion=$BuildVersion $packProperties --no-build --no-restore";
    Invoke-Expression -Command $packCmd;
}