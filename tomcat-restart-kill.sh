## java env
export JAVA_HOME=/usr/java/jdk1.7.0_80
export JRE_HOME=$JAVA_HOME/jre

## you just need to change this param name
WAR_NAME=project-a
WAR_PLACE=/app/wars

current_dir=$(cd `dirname $0`; pwd)

echo 'stop tomcat:'"$current_dir"".............................."  
$current_dir/bin/shutdown.sh
sleep 2

ps -ef|grep $current_dir|grep -v 'grep\|tomcat-restart-kill.sh'| awk '{print $2}'|xargs -i kill -9 {}
sleep 2

rm -rf $current_dir/webapps/*/
rm -rf $WAR_PLACE/$WAR_NAME
unzip $WAR_PLACE/$WAR_NAME\.war -d $WAR_PLACE/$WAR_NAME
sleep 2

echo "=== start  tomact ................."
$current_dir/bin/startup.sh
