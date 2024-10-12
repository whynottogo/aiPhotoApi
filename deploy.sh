#!/bin/bash  
  
# 脚本路径  
script_path=$(cd $(dirname $0); pwd)
echo $script_path
cd $script_path
mvn clean
mvn package -DskipTests
# 查找以boot结尾的文件夹下的jar包路径  
jar_path=$(find "$script_path" -name "*.jar" | grep -e 'hivision.jar')
  
# 检查是否找到jar包  
if [ -f "$jar_path" ]; then  
  echo "找到JAR包: $jar_path"  
else
  echo "未找到以boot结尾的JAR包"  
  exit 1  
fi

# 远程服务器信息
remote_server="47.109.76.12"
remote_user="root"
remote_password="suadiahi@1."
remote_script="script.sh"
remote_path="/home/software/divisionApi"

# 传输jar包到远程服务器并执行脚本
# sshpass -p "$remote_password" scp -P 2026 "$jar_path" "$remote_user@$remote_server:$remote_path" && \
# sshpass -p "$remote_password" ssh -p 2026 "$remote_user@$remote_server" "cd $remote_path && sh $remote_script"


# 传输jar包到远程服务器并执行脚本
rsync -Pvz -e 'ssh -p 6000' "$jar_path" "$remote_user@$remote_server:$remote_path" && \
#sshpass -p "$remote_password" scp -v -P 2026 "$jar_path" "$remote_user@$remote_server:$remote_path" && \
sshpass -p "$remote_password" ssh -p 6000 "$remote_user@$remote_server" "cd $remote_path && sh ./$remote_script"
echo "=================部署完成================="