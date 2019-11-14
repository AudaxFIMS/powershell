$target = 'nginx'
$workdir = "c:\nginx"

function startNginx {
    echo "Start Nginx"

    $processes = Get-Process | Where-Object {$_.ProcessName -eq $target}
    Foreach($process in $processes) {
        $process.Kill();
    }

    $process = Start-Process -FilePath "nginx.exe" -WorkingDirectory "$workdir" -PassThru -WindowStyle Hidden -Wait

    startNginx
}

startNginx