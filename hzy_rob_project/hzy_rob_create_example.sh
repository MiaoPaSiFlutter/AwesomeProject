#!/bin/bash
###
# @Descripttion:
# @version:
# @Author: TT
# @Date: 2023-05-17 16:20:32
# @LastEditors: TT
# @LastEditTime: 2023-05-19 11:39:57
###

# shellcheck disable=SC2154
# shellcheck source=/dev/null

source ./hzy_rob_tool.sh
# source ./hzy_rob_config.sh

chmod a+x hzy_rob_tool.sh

robCreateExampleProject() {
    echomsg "创建事例,适用于Package,Plugin"
    case "${template}" in
    "package" | "plugin")
        flutter create -i "$ilanguage" -a "$alanguage" --platforms="$platforms" --pub example
        ;;
    *)
        echo "$template"
        ;;
    esac
    cd "example" || exit
    # 创建资源
    createDir "assets"
    cd "assets" || exit
    for item in "${assetsChildarr[@]}"; do
        createDir "$item"
    done
    tree

    # 创建整体项目文件
    cd ..
    cd "lib" || exit
    mkdirAppLibChild
    # 修改main文件
    createFileAndWriteContent "main.dart" "$cr_main"
    # 修改pubspec
    packAgeName="\\
  $project_name:"
    packagePath="\\
    path: ../"
    cd ..
    addPackageToPubspec "$judgment_third" "  hzy_common_module:" "$cr_hzy_normal_widget"
    addPackageToPubspec "$judgment_third" "  $project_name" "$packAgeName" 1
    addPackageToPubspec "  $project_name:" "    path: ../" "$packagePath" 1
    sed -i '' 's/#.*//;/^  $/d;/^$/d' "$judgment_file"
    cd ..

}
# 创建事例
hzyRobCreateExample() {
    project_path="$path/$project_name"
    echomsg "$project_path"
    cd "$project_path" || exit
    echomsg "删除无用平台文件"
    for item in "${platformsArr[@]}"; do
        echo "$item"
        if [ -d "$item" ]; then
            rm -rf "$item"
        fi
    done
    path="$project_path"
    package_name=$project_name
    echo "$package_name"
    project_name=example
    template=app
    createFlutterProject
    mkdirAssets
    createNeedProject
    modifyMian
    cd "$project_path" || exit
    # 修改pubspec
    #
    packAgeName="\\
  $package_name:"
    packagePath="\\
    path: ../"
    echo "$packAgeName"
    echo "$packagePath"
    addPackageToPubspec "$judgment_third" "  $package_name" "$packAgeName" 1
    addPackageToPubspec "  $package_name:" "    path: ../" "$packagePath" 1
    modifyPubspec
    modifyTest

}

# package 创建Example
packageCreateExample() {
    case "${template}" in
    "package" | "plugin")
        # 创建Example工程
        hzyRobCreateExample
        ;;
    *) ;;
    esac
}
