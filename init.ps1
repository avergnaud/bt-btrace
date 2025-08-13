
$env:JAVA_HOME = 'C:\Users\a.vergnaud\dev\jdk-23'

$env:BTRACE_HOME = 'C:\Users\a.vergnaud\dev\btrace\btrace-v2.2.6-bin'

$env:PATH = "$($env:JAVA_HOME)\bin;$env:PATH"

jps -l