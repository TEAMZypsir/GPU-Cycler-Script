Write-Host "This script requires running with administrator privileges." -ForegroundColor Green

# Main script execution (when running as admin)

# Define the target GPU instance ID (example for NVIDIA GeForce RTX 2080 Super)
$targetGPU = "PCI\VEN_10DE&DEV_1E81&SUBSYS_31883842&REV_A1\4&C51F17B&0&00E8"

# Define the path to Cyberpunk 2077 executable
$GamePath = "D:\Cyberpunk 2077\bin\x64\Cyberpunk2077.exe"


# Force display driver restart to recognize all available GPUs
Write-Host "Restarting display drivers..." -ForegroundColor Yellow
Restart-Service -Name "Display" -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 5

Write-Host "Disabling GPU..." -ForegroundColor Cyan
Disable-PnpDevice -InstanceId $targetGPU -Confirm:$false

Write-Host "Launching Game..." -ForegroundColor Cyan
# Launch Cyberpunk 2077
Start-Process $GamePath

Write-Host "Waiting 15 seconds before re-enabling GPU..." -ForegroundColor Yellow
# Wait 15 seconds with countdown
for ($i = 15; $i -gt 0; $i--) {
    Write-Progress -Activity "Waiting to re-enable GPU" -Status "$i seconds remaining" -PercentComplete ((15-$i)/15*100)
    Start-Sleep -Seconds 1
}

Write-Host "Re-enabling GPU..." -ForegroundColor Cyan
# Re-enable the GPU
Enable-PnpDevice -InstanceId $targetGPU -Confirm:$false

Write-Host "Script completed successfully!" -ForegroundColor Green
Start-Sleep -Seconds 5
Write-Host "Exiting..." -ForegroundColor Red
Start-Sleep -Seconds 2
exit