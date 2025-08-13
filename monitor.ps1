param(
  [Parameter(Mandatory = $true, Position = 0)]
  [int]$TargetPid,

  [Parameter(Mandatory = $false, Position = 1)]
  [string]$TraceScript = (Join-Path $PWD 'TraceJackson.java')
)

Write-Host "Using target PID: $TargetPid"
Write-Host "Using trace script: $TraceScript"

# List jars for visibility
Get-ChildItem -Path "$env:BTRACE_HOME\libs" -Filter "*.jar" | Format-Table Name, FullName -AutoSize

# Remove env vars that can interfere
Remove-Item Env:_JAVA_OPTIONS -ErrorAction SilentlyContinue
Remove-Item Env:JAVA_OPTS -ErrorAction SilentlyContinue
Remove-Item Env:JAVA_TOOL_OPTIONS -ErrorAction SilentlyContinue

# Find the client & agent jars
$libs = Get-ChildItem -Path "$env:BTRACE_HOME\libs" -Filter "*.jar"
$clientJar = ($libs | Where-Object { $_.Name -match 'client' } | Select-Object -First 1).FullName
$agentJar  = ($libs | Where-Object { $_.Name -match 'agent'  } | Select-Object -First 1).FullName

if (-not $clientJar -or -not $agentJar) {
  Write-Error "Could not find BTrace client/agent jars under $($env:BTRACE_HOME)\libs. Check the folder listing."
  return
}

Write-Host "Client jar: $clientJar"
Write-Host "Agent  jar: $agentJar"

# Launch BTrace attachment
& "$env:JAVA_HOME\bin\java.exe" `
    -cp "$clientJar;$agentJar" `
    org.openjdk.btrace.client.Main `
    -p 9091 `
    $TargetPid `
    $TraceScript
