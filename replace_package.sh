#!/bin/bash

#需要扫描的目录
SCAN_PATH=$1
#需要扫描的jar文件名
FILE_NAME=$2
#扫描出来的文件需要备份的目录

#已修复漏洞的版本的文件名称
FIXED_JAR=$3

#扫描结果文件
SCAN_RESULT=./scan_result.txt
#替换结果
RESPACE_RESULT=./respace_result.txt
#
#判断是否存在参数
if [ $# -ne 3 ] || [ ! -n ${SCAN_PATH} ]
    then
        echo -e "\033[31m 请输入需要扫描的目录和文件,示例:sh scan_package.sh /home/log4j_test/app *log4j-core*.jar \033[0m"
    else
        echo "#####开始扫描，涉及${FILE_NAME}的目录扫描结果如下:"
        find ${SCAN_PATH} -name "${FILE_NAME}" | awk -F "/" '{for (i=1;i<=NF-1;i++) printf("%s/", $i);print ""}' > ${SCAN_RESULT}
        cat ${SCAN_RESULT}
        echo "涉及到目录请查看${SCAN_RESULT}"
fi
#判断修复的jar包文件是否存在
if [ ! -f ${FIXED_JAR} ]
    then
       echo -e "\033[31m 请输入需要替换的文件,示例:sh replace_package.sh /home/log4j_test/app *log4j-core*.jar ../resource/app_jar/log4j-core-2.15.0-rc2.jar \033[0m"
    else
        echo "#####开始备份，涉及${FILE_NAME}的目录下的文件:"
        #在搜索出来的匹配文件目录下，备份
        find ${SCAN_PATH} -name "${FILE_NAME}" | xargs -I {} mv {} {}.bak
        echo "#####备份完成，目录为${FILE_NAME}"
        #拷贝修复文件到原目录
        for line in `cat ${SCAN_RESULT}`
        do
            echo "#####开始拷贝${FIXED_JAR}到${line}"
            cp -r ${FIXED_JAR} ${line}
            echo "#####${FIXED_JAR}到${line}拷贝完成"
        done
fi
