#!/bin/bash

#需要扫描的目录
SCAN_PATH=$1
#需要扫描的jar文件名
FILE_NAME=$2
#扫描结果记录文件
SCAN_RESULT=./scan_result.txt

#判断是否存在参数
if [ $# -ne 2 ] || [ ! -n ${SCAN_PATH} ]
    then
        echo -e "\033[31m 请输入需要扫描的目录和文件,示例:sh scan_package.sh /home/log4j_test/app *log4j-core*.jar \033[0m"
    else
        echo "开始扫描，涉及${FILE_NAME}的目录扫描结果如下:"
        find ${SCAN_PATH} -name "${FILE_NAME}" | awk -F "/" '{for (i=1;i<=NF-1;i++) printf("%s/", $i);print ""}' > ${SCAN_RESULT}
        cat ${SCAN_RESULT}
        echo "涉及到目录请查看${SCAN_RESULT}"
fi
