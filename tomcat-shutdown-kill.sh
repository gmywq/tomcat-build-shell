## java env
export JAVA_HOME=/usr/java/jdk1.7.0_80
export JRE_HOME=$JAVA_HOME/jre

current_dir=$(cd `dirname $0`; pwd)

echo 'stop tomcat:'"$current_dir"".............................."
$current_dir/bin/shutdown.sh
sleep 2

ps -ef|grep $current_dir|grep -v 'grep\|tomcat-shutdown-kill.sh'| awk '{print $2}'|xargs -i kill -9 {}
sleep 2

echo 'stop success:'"$current_dir"".............................."  
