# bt-btrace

https://github.com/btraceio/btrace/releases


$env:JAVA_HOME = 'C:\Users\a.vergnaud\dev\jdk-23'

$env:BTRACE_HOME = 'C:\Users\a.vergnaud\dev\btrace\btrace-v2.2.6-bin'

$env:PATH = "$($env:JAVA_HOME)\bin;$($env:BTRACE_HOME)\bin;$env:PATH"

jps -l

26904




java -cp "$clientJar;$agentJar" org.openjdk.btrace.client.Main -p 26904 TraceJackson.java

...

powershell

cd 'C:\Users\a.vergnaud\dev\btrace\bt-btrace'

$env:JAVA_HOME = 'C:\Users\a.vergnaud\dev\jdk-23'

$env:PATH = "$($env:JAVA_HOME)\bin;$env:PATH"

$env:BTRACE_HOME = 'C:\Users\a.vergnaud\dev\btrace\btrace-v2.2.6-bin'

java -version
jps -l

Get-ChildItem -Path "$env:BTRACE_HOME\libs" -Filter "*.jar" | Format-Table Name, FullName -AutoSize

Remove-Item Env:_JAVA_OPTIONS -ErrorAction SilentlyContinue
Remove-Item Env:JAVA_OPTS -ErrorAction SilentlyContinue
Remove-Item Env:JAVA_TOOL_OPTIONS -ErrorAction SilentlyContinue

$libs = Get-ChildItem -Path "$env:BTRACE_HOME\libs" -Filter "*.jar"
$clientJar = ($libs | Where-Object { $_.Name -match 'client' } | Select-Object -First 1).FullName
$agentJar  = ($libs | Where-Object { $_.Name -match 'agent'  } | Select-Object -First 1).FullName

if (-not $clientJar -or -not $agentJar) {
  Write-Error "Could not find btrace client/agent jars under $($env:BTRACE_HOME)\lib. Check the folder listing."
  return
}

"Client jar: $clientJar"

"Agent  jar: $agentJar"

$targePid = 1480                # <-- replace with the PID you want
$script = Join-Path $PWD 'TraceJackson.java'  # or full path

& "$env:JAVA_HOME\bin\java.exe" -cp "$clientJar;$agentJar" org.openjdk.btrace.client.Main -p 9091 $targePid $script

