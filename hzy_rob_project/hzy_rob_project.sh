#!/bin/bash
###
# @Descripttion:
# @version:
# @Author: TT
# @Date: 2023-01-03 16:28:46
# @LastEditors: TT
# @LastEditTime: 2023-07-10 14:13:44
###
# shellcheck disable=SC2154
# shellcheck source=/dev/null
source ./hzy_rob_tool.sh
source ./hzy_rob_config.sh
source ./hzy_rob_create_example.sh
chmod a+x hzy_rob_tool.sh hzy_rob_config.sh hzy_rob_create_example.sh

# ==================== 自动化创建项目 ==================== #
# ==================== 前提 获取脚本参数 ==================== #
# 进入到项目根目录
echomsg "前提配置参数"
configParams "$@"
normalParamsExplain

# ==================== 第一步 创建项目 ==================== #

# 创建项目
createFlutterProject() {
    cd "$path" || exit
    if [ ! -d "$project_name" ]; then
        echomsg "第一步"
        echo "${template}创建中..."
        case "${template}" in
        "app")
            flutter create --org "$org" -i "$ilanguage" -a "$alanguage" --platforms="$platforms" --pub "$project_name"
            ;;
        "package")
            flutter create --org "$org" -t "$template" --pub "$project_name"
            ;;
        "plugin")
            flutter create --org "$org" -t "$template" --pub -i "$ilanguage" -a "$alanguage" --platforms="$platforms" "$project_name"
            ;;
        "module")
            flutter create --org "$org" -t "$template" --pub "$project_name"
            ;;
        esac
        project_path="$path/$project_name"
        echo '项目创建完成'
    else
        echomsg "紧急‼️  提示"
        read -r -n 1 -p "项目已存在,是否删除并重新创建> y/n:" char
        printf "\n"
        if [ "$char" == "y" ]; then
            echo '正在删除中...'
            cd "$path" || exit
            rm -rf "$project_name"
            echo '删除完成'
        else
            read -r -p "请重新输入项目名字:" pname
            printf "\n"
            echo "$pname"
            if [ "$pname" != "$project_name" ]; then
                project_name="$pname"
                project_path="$path/$project_name"
            fi
            read -r -p "请重新输入项目包名:" porg
            printf "\n"
            echo "$porg"
            if [ "$porg" != "$org" ]; then
                org=$porg
            fi
        fi
        createFlutterProject
    fi
}

# ==================== 第二步 创建资源文件 ==================== #

# 创建资源
mkdirAssets() {
    echomsg "第二步"
    echo '资源文件创建中...'
    project_path="$path/$project_name"
    # 进入到项目根目录
    cd "$project_path" || exit
    createDir "assets"
    cd "assets" || exit
    for item in "${assetsChildarr[@]}"; do
        createDir "$item"
    done
    tree
    echo "资源文件创建完成"
}

# ==================== 第三步 创建工程文件 ==================== #
# 创建整体项目文件
createNeedProject() {
    echomsg "第三步"
    echo "项目文件创建中..."
    lib="$project_path/lib"
    cd "$lib" || exit
    case "${template}" in
    "app")
        mkdirAppLibChild
        ;;
    "package")
        mkdirPackAgeLibS "$project_name"
        ;;
    *)
        echo "$template"
        ;;
    esac
    tree
    echo "项目文件创建完成"
}

# ==================== 第四步 修改main文件 ==================== #
modifyMian() {
    echomsg "第四步"
    echo "修改主文件中..."
    lib="$project_path/lib"
    cd "$lib" || exit
    case "${template}" in
    "app")
        case "${level}" in
        "mini")
            echo "基础版:app不需要修改"
            ;;
        "normal" | "plus" | "pro")
            createFileAndWriteContent "main.dart" "$cr_main"
            ;;
        esac
        echo "main文件修改完成"
        ;;
    "package")
        case "${level}" in
        "mini")
            echo "基础版:不需要修改"
            ;;
        "normal" | "plus" | "pro")
            createFileAndWriteContent "${project_name}.dart" "
library ${project_name};
export 'package:$project_name/$project_name/${project_name}_index.dart';
            "
            echo "packgee文件修改完成"
            ;;
        esac
        ;;
    *)
        echo "$template"
        ;;
    esac

}
# ==================== 第五步 修改pubspec ==================== #

# 修改App 模式下pubspec
modifyAppPubspec() {
    case "${level}" in
    "mini")
        echo "基础版:app不添加任何三方库"
        ;;
    "normal")
        addPackageToPubspec "$judgment_third" "  hzy_normal_tool:" "$cr_hzy_normal_tool"
        addPackageToPubspec "$judgment_third" "  get:" "$cr_get"
        addPackageToPubspec "$judgment_third" "  flutter_screenutil:" "$cr_screenutil"
        ;;
    "plus")
        # 给pubspecy 添加文件
        # 添加需要的第三方库
        addPackageToPubspec "$judgment_third" "  hzy_common_module:" "$cr_hzy_normal_widget"
        addPackageToPubspec "$judgment_third" "  device_frame:" "$cr_device_frame"
        addPackageToPubspec "$judgment_third" "  flutter_localizations:" "$cr_localizations"
        ;;
    "pro")
        # 添加演示事例模块

        addPackageToPubspec "$judgment_third" "  hzy_common_module:" "$cr_hzy_normal_widget"
        addPackageToPubspec "$judgment_third" "  device_frame:" "$cr_device_frame"
        addPackageToPubspec "$judgment_third" "  flutter_localizations:" "$cr_localizations"
        ;;
    esac

    # 添加图片索引
    addPackageToPubspec "$judgment_assets" "  assets:" "$cr_assent"
}

# 修改 Package 模式下pubspec
modifyPackagePubspec() {
    cd "$project_path" || exit
    case "${level}" in
    "mini")
        echo "基础版:package不添加任何三方库"
        ;;
    "plus" | "pro" | "normal")
        addPackageToPubspec "dependencies:" "  hzy_common_module:" "$cr_hzy_normal_widget"
        addPackageToPubspec "version:" "publish_to: " "$cr_publish_to"
        ;;
    esac
    # 添加图片索引
    addPackageToPubspec "flutter:" "  assets:" "$cr_assent"
    read -r -p "请输入你的仓库地址,用于配置pusbspec.yaml中的homepage>:" homepage
    printf "\n"
    echo "$homepage"
    if [ "$homepage" == "" ]; then
        homepage=http
    fi
    sed -i '' "s/homepage:.*/homepage: \"${homepage}\"/g" "$judgment_file"
}

# 修改内容
modifyPubspec() {
    echomsg "第五步"
    echo "修改pubspec..."
    # 进入到项目根目录
    cd "$project_path" || exit

    case "${template}" in
    "app")
        modifyAppPubspec
        ;;
    "package")
        modifyPackagePubspec
        ;;
    *)
        echo "$template"
        ;;
    esac
    # 替换以包含#以后的内容为 空行
    # 并删除空行
    sed -i '' 's/#.*//;/^  $/d;/^$/d' "$judgment_file"
    # sed -i '' 's/^  #.*//;/^$/d' "$judgment_file"
    echo "pubspec修改完成"
}

# ==================== 第六步 修改测试文件 ==================== #

modifyTest() {
    echomsg "第六步"
    echo "修改test文件中..."
    cd "$project_path" || exit
    pwd
    case "${template}" in
    "app")
        cd 'test' || exit
        case "${level}" in
        "mini")
            echo "基础版:不需要做任何修改"
            ;;
        "normal" | "plus" | "pro")
            createFileAndWriteContent "$project_path/test/widget_test.dart" "import 'package:$project_name/init/init.dart';"
            addContentToEndOnly "$cr_test" "$project_path/test/widget_test.dart"

            ;;
        esac
        ;;
    "package")
        rm -rf test
        echo "$template"
        ;;
    *)
        echo "$template"
        ;;
    esac
    echo "test文件修改完成"
}
# ==================== 第七步 pub get ==================== #

configUpdata() {
    cd "$project_path" || exit
    echomsg "第七步"
    echo "更新项目"
    flutter clean
    flutter pub get
}

# ==================== 第八步 打开项目 ==================== #
openProject() {
    echomsg "第八步"
    echo '打开项目'
    if ! type Visual Studio Code >/dev/null 2>&1; then
        userAndroidStudioOpen
    else
        useVsCodeOpenPorject
    fi
}
# ==================== 第九步 启动项目 ==================== #

runProject() {
    cd "$project_path" || exit
    case "${template}" in
    "app")
        echomsg "第九步"
        echo "启动web中..."
        flutter run -d chrome
        ;;
    "package")
        echo "$template"
        ;;
    *)
        echo "$template"
        ;;
    esac
}

createFlutterProject
mkdirAssets
createNeedProject
modifyMian
modifyPubspec
modifyTest
configUpdata
packageCreateExample
openProject
runProject
echomsg '演示完成'
