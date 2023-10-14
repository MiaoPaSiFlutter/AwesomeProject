#!/bin/bash
###
# @Descripttion:
# @version:
# @Author: TT
# @Date: 2023-01-03 16:28:55
# @LastEditors: TT
# @LastEditTime: 2023-05-17 17:27:20
###

# shellcheck disable=SC2034
# shellcheck disable=SC2046
# shellcheck source=/dev/null
# source ./hzy_rob_tool.sh
# chmod a+x hzy_rob_tool.sh

# 系统名字 Darwin:苹果  Linux:  Linux
os_name=$(uname -s)
# 脚本当前路径
path=$(
  cd "$(dirname "$0")" || exit
  pwd
)

# 安卓平台开发语言
alanguage="kotlin"
# ios平台开发语言
ilanguage="swift"
# 支持平台
platforms="android,ios,web"
# 创建的工程名字
project_name="example"
# 包名
org="com.example.project"
# 创建类型
template="app"
# 项目级别
level="normal"
# 创建的工程路径
project_path="$path/$project_name"

# 判断依据之项目文件
judgment_file="pubspec.yaml"
# 判断依据之package
judgment_third="  cupertino_icons"
# 判断依据之资源索引
judgment_assets="  uses-material-design:"

# 用于安装vscode code 命令
cr_vscode_code="# Add Visual Studio Code (code)
export PATH=\"\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin\""

# lib 一级目录
# lib->config文件二级目录
declare -a configDirArr=("dataconfig" "routers" "transformers")
# dataconfig 目录
declare -a dataconfigfileArr=("global" "http_normal" "normal" "page_id")
# 资源子文件 数组
declare -a assetsChildarr=("images" "fonts" "json")
# ==== 基础项目 ==== #

# ==== 模块化 ==== #

# 模块化开发 项目目录
declare -a moduleLibDirArr=(compontents models network vm pages routers tools)
declare -a platformsArr=(web linux macos ios windows android)
