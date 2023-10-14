#!/bin/bash###
###
# @Descripttion:
# @version:
# @Author: TT
# @Date: 2023-01-03 23:02:59
# @LastEditors: TT
# @LastEditTime: 2023-07-10 14:15:24

# shellcheck source=/dev/null
# shellcheck disable=SC2154
source ./hzy_rob_config.sh
source ./hzy_rob_insert_content.sh
chmod a+x hzy_rob_config.sh hzy_rob_insert_content.sh

# 统一输出
echomsg() {
    echo "==================== $1 ===================="
}

# 帮助说明
usage() {
    echo "
Usage:
    -o, --org                 工程包名
                                    eg: -o com.example.example 
                                        -org=com.example.example

    -n, --name                工程名字 
                                    eg: -n example 
                                        -name=example

    -t, --template            工程模版 
                                    [app] 默认app
                                    [module] flutter 模块开发,用于原生 嵌入 flutter
                                    [package]纯Dart库
                                    [plugin]针对Android、iOS、Web、MacOS、Windows或Linux,或者把它们组合到一起的库
                                    eg: -t plugin 
                                        --template=plugin

    -p, --platforms           指定支持平台数组
                                    [android,ios,web,MacOS,Windows,Linux]
                                    默认 [android,ios,web]
                                    eg: -p android,ios,web
                                        --platforms=android,ios,web

    -i, --ios-language        ios开发语言
                                    [swift,oc]
                                    默认 swift
                                    eg: -i swift 
                                        --ios-language=swift

    -a, --android-language    android开发语言
                                    [java,kotlin]
                                    默认 kotlin
                                    eg: -a kotlin
                                        --android-language=kotlin

    -l, --level               项目级别
                                    mini   创建通用项目目录(不添加任何三方库依赖)
                                    normal 创建通用项目目录(添加基础依赖)
                                    plus   创建通用项目并添加通用依赖(这个通用依赖,取决你的使用),
                                    pro    创建模块化开发版本
                                    默认    normal
                                    eg: -l normal
                                        --level=normal
    
    -r, --route               项目根路径                                   
    -h, --help                显示帮助信息
    

    example1: sh hzy_rob_project.sh -o com.example.example -n example
    example2: sh hzy_rob_project.sh --org=com.example.example --name=example
"
}

# ================ 工程参数配置 ================ #

# 默认参数说明
normalParamsExplain() {
    echo "参数配置完成:
工程名字:$project_name
工程包名:$org
工程模版:$template
支持平台:$platforms
iOS语言: $ilanguage
安卓语言:$alanguage
项目级别:$level
项目路径:$path
"
}
# 配置脚本参数
configParams() {
    echo '传入的参数'
    echo "$@"
    param_count=$#
    if [ $param_count != 0 ]; then
        while [ -n "$1" ]; do
            case "$1" in
            -h | --help)
                usage
                exit
                ;;
            -n | --name)
                project_name=$2
                echo "name:$project_name"
                ;;
            -o | --org)
                org=$2
                echo "org:$org"
                ;;
            -t | --template)
                template=$2
                echo "template:${template}"
                ;;
            -p | --platforms)
                platforms=$2
                echo "platforms:$platforms"
                ;;
            -i | --ios-language)
                ilanguage="$2"
                echo "ios:$ilanguage"
                ;;
            -a | --android-language)
                alanguage="$2"
                echo "android:${alanguage}"
                ;;
            -l | --level)
                level="$2"
                echo "level:${level}"
                ;;
            -r | --route)
                path="$2"
                echo "path:${path}"
                ;;
            esac
            shift
        done
    fi
    if [ "$project_name" == "example" ]; then
        project_name="${project_name}_${template}"
    fi

}

# ================ 创建文件夹 ================ #

# 创建模块化工程 项目架构
mkdirPackAgeLibS() {

    case "${level}" in
    "mini")
        echo "mini"
        ;;
    "normal" | "plus" | "pro")
        createDir "$1"
        cd "$1" || exit
        module_index_content=""
        for item in "${moduleLibDirArr[@]}"; do
            echo "$item"
            createDir "$item"
            cd "$item" || exit
            if [ "$item" == "network" ]; then
                # 配置网络请求文件
                createFileAndWriteContent "${project_name}_http_config.dart" ""
                createFileAndWriteContent "${project_name}_api_utils.dart" ""
                createFileAndWriteContent "${item}_index.dart" "export '${project_name}_http_config.dart';
export '${project_name}_api_utils.dart';"
            elif [ "$item" == "routers" ]; then
                # 配置路由文件
                createFileAndWriteContent "${project_name}_pages.dart" ""
                createFileAndWriteContent "${project_name}_routers.dart" ""
                createFileAndWriteContent "${item}_index.dart" "export '${project_name}_routers.dart';
export '${project_name}_pages.dart';"
            else
                createFileAndWriteContent "${item}_index.dart" ""
            fi
            cd ..
            module_index_content="export '$item/${item}_index.dart';
$module_index_content"
            createFileAndWriteContent "$1_index.dart" "$module_index_content"
        done
        ;;
    esac

    cd ..
}

# 创建演示模块
# 图虫图片浏览
mkdirTuChongModule() {
    pages="$project_path/lib/modules"
    cd "$pages" || exit
    if [ -d "tuchong_module" ]; then
        rm -rf "tuchong_module"
    fi
    git clone "https://gitee.com/tengteng_fan/hzy_normal_project.git"
    cd "hzy_normal_project/lib/modules/" || exit
    cp -r "example_module" "$pages/module/"
    cd "$pages" || exit
    rm -rf "hzy_normal_project"
    # mv "module" "tuchong_module"
}

# 创建通用项目 config 文件内容
mkdirConfigChild() {
    configindex=""
    for item in "${configDirArr[@]}"; do
        createDir "$item"
        cd "$item" || exit
        content=""
        case "${item}" in
        "dataconfig")
            # 插入到index的内容
            dataconfiginfo=""
            # 根据选择的项目等级
            # 配置不同的写入内容
            case "${level}" in
            "normal" | "mini")
                dataconfigfilecontentArr=("$cr_glob_config" "$cr_http_normal" "$cr_normal_config" "$cr_page_id_config")
                ;;
            "plus")
                dataconfigfilecontentArr=("$cr_glob_config_pro" "$cr_http_normal" "$cr_normal_config" "$cr_page_id_config")
                ;;
            "pro")
                dataconfigfilecontentArr=("$cr_glob_config_pro" "$cr_http_normal" "$cr_normal_config" "$cr_page_id_config")
                ;;
            esac

            # 获取dataconfig 文件个数
            filelength=${#dataconfigfileArr[@]}
            for ((i = 0; i < "$filelength"; i++)); do
                # dataconfig 文件名字
                name="${dataconfigfileArr[i]}_config.dart"
                # 创建dataconfig 二级文件并插入数据
                createFileAndWriteContent "$name" "${dataconfigfilecontentArr[i]}"
                # 配置索引文件
                dataconfiginfo="export '$name';
$dataconfiginfo"
                content="$dataconfiginfo"
            done
            ;;
        "routers")
            # 配置路由模块
            case "${level}" in
            "mini")
                routercontent="$cr_routers"
                ;;
            "normal")
                routercontent="$cr_routers_normal"
                ;;
            "plus")
                routercontent="$cr_routers_plus"
                ;;
            "pro")
                routercontent="$cr_routers_pro"
                ;;
            esac
            createFileAndWriteContent "routers.dart" "$routercontent"
            content="export 'routers.dart';"
            ;;
        esac
        createFileAndWriteContent "${item}_index.dart" "$content"
        cd ..
        configindex="export '${item}/${item}_index.dart';
$configindex"
    done
    result=$configindex

}

# 创建通用项目 一级文件
mkdirAppLibChild() {
    initContent=$cr_application
    case "${level}" in
    "mini")
        # 简约款
        libArr=("compontents" "config" "models" "network" "utils" "pages" "vm")
        ;;
    "normal")
        # 正常款
        libArr=("compontents" "config" "init" "utils" "pages" "models" "network" "vm")
        initContent=$cr_init_normal
        ;;
    "plus")
        # 升级款
        libArr=("compontents" "config" "init" "modules" "utils" "pages")
        initContent=$cr_init_plus
        ;;
    "pro")
        # 专业款
        libArr=("compontents" "config" "init" "utils" "pages")

        ;;
    esac
    for item in "${libArr[@]}"; do
        createDir "$item"
        cd "$item" || exit
        content=""
        case "${item}" in
        "config")
            mkdirConfigChild
            content="$result"
            item="config"
            ;;
        "init")
            createFileAndWriteContent "init.dart" "$initContent"
            createFileAndWriteContent "my_home_page.dart" "$cr_my_home_page"
            content="export 'init.dart';
            export 'my_home_page.dart';
            "
            ;;
        "modules")
            mkdirTuChongModule
            ;;
        # "pages")
        #     if [ "${level}" == "plus" ]; then
        #         mkdirTuChongModule
        #         content="export 'tuchong_module/module_index.dart';"
        #     elif [ "${level}" == "normal" ]; then
        #         mkdirPackAgeLibS "module"
        #         content="export 'module/module_index.dart';"
        #     fi
        #     item="pages"
        #     ;;

        esac
        createFileAndWriteContent "${item}_index.dart" "$content"
        cd ..
        # 暂时不需要使用这个
        #         project_index="export '${item}/${item}_index.dart';
        # $project_index"
    done
    # createFileAndWriteContent "project_index.dart" "$project_index"
}

# ================ 文件操作 ================ #

# 创建文件夹
createDir() {
    dirName=$1
    if [ ! -d "$dirName" ]; then
        mkdir -p "$dirName"
    fi
}

# 创建文件 并写入数据
# 需要两个参数
# 1 创建文件名字
# 2 写入内容
createFileAndWriteContent() {
    dirname=$1
    content=$2
    if [ -d "$dirname" ]; then
        rm -rf "$dirname"
    fi
    cat >"$dirname" <<EOF
$content
EOF
}

# 添加内容到文件后面
addContentToEnd() {
    addcontent=$1
    filepath=$2
    echomsg "$2"
    if grep "$addcontent" "$filepath"; then
        echomsg "$1"
        echo "添加内容已存在"
    else
        addContentToEndOnly addcontent filepath
    fi
}

addContentToEndOnly() {
    addcontent=$1
    filepath=$2
    cat <<EOF >>"$filepath"
$addcontent
EOF
    cat "$filepath"
}

# ================ pubspe文件 ================ #
# 添加依赖库到pubspec文件
# 需要3个参数
# 1 添加位置的判断内容
# 2 添加内容的判断依据
# 3 添加内容
addPackageToPubspec() {
    # 参数个数
    param_count=$#
    sedType=0
    if [ $param_count == 4 ]; then
        sedType=1
    fi

    # 添加位置
    addposition=$1
    # 是否需要添加的依据
    addjudge=$2
    # 添加内容
    addcontent=$3

    if grep -n "^$addjudge" "$judgment_file"; then
        echo "已存在,不需要再添加"
    else
        line_num=$(($(grep -n "^$addposition" "$judgment_file" | awk -F ':' '{print $1}') + 1))
        echo "$line_num"

        if [ $line_num != 1 ]; then
            if [ $sedType == 0 ]; then
                sed -i '' "${line_num} i\
        $addcontent
        " "$judgment_file"
            else
                sed -i '' "${line_num} i\
        $addcontent\\
        " "$judgment_file"
            fi
        fi
    fi
}

# ================ 打开项目 ================ #

# 使用Android studio 打开程序
userAndroidStudioOpen() {
    if [ "$os_name" == Darwin ]; then
        if open -a/Applications/Android\ Studio.app "$project_path"; then
            echo 'Android Studio 打开项目'
        else
            open "$project_path"
        fi
    elif [ "$os_name" == Linux ]; then
        echo "暂不支持Linux,用Android Studio 打开项目"
        open "$project_path"
    else
        echo "暂不支持Linux,用Android Studio 打开项目"
        open "$project_path"
    fi

}
# 使用VsCode 打开项目
useVsCodeOpenPorject() {
    # 从测试中.得到两种方式打开app
    # 1. open -a 启动工程

    if [ "$os_name" == Darwin ]; then
        if open -a/Applications/Visual\ Studio\ Code.app "$project_path"; then
            echo 'Visual Studio Code 打开项目'
        else
            userAndroidStudioOpen
        fi
    elif [ "$os_name" == Linux ]; then
        echo "暂不支持Linux,用Android Studio 打开项目"
        open "$project_path"
    else
        echo "暂不支持Linux,用Android Studio 打开项目"
        open "$project_path"
    fi
    # 2. 设置Visual Studio Code 快捷方式,启动工程
    # if code "$project_path"; then
    #     echo 'Visual Studio Code 打开项目'
    # else
    #     installVisualStudioCode
    # fi
}

# 安装 code
installVisualStudioCode() {
    if [ "$os_name" == Darwin ]; then
        addContentToEnd "$cr_vscode_code" ~/.bash_profile
        addContentToEnd "$cr_vscode_code" ~/.zshrc
        useVsCodeOpenPorject
    elif [ "$os_name" == Linux ]; then
        echo "暂不支持Linux,用Visual Studio Code 打开项目"
        open "$project_path"
    else
        echo "暂不支持Linux,用Visual Studio Code 打开项目"
        open "$project_path"
    fi
}
