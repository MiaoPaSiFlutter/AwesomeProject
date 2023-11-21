import os

# 指定flutter_ui文件夹的路径
flutter_ui_path = "./"

# 指定输出的Markdown文档路径
output_md_path = "./screenshots.md"

# 打开Markdown文档并写入标题
with open(output_md_path, 'w') as md_file:
    md_file.write("# Flutter UI Screenshots\n\n")

    # 遍历flutter_ui文件夹下的子文件夹
    for ui_folder in os.listdir(flutter_ui_path):
        ui_folder_path = os.path.join(flutter_ui_path, ui_folder)

        # 检查是否是文件夹
        if os.path.isdir(ui_folder_path):
            md_file.write(f"- {ui_folder}\n\n")  # 写入子文件夹名字

            # 检查是否存在截图文件夹
            screenshots_folder_path = os.path.join(ui_folder_path, "assets/screenshots")
            if os.path.exists(screenshots_folder_path) and os.path.isdir(screenshots_folder_path):
                # 遍历截图文件夹下的所有文件
                for screenshot_file in os.listdir(screenshots_folder_path):
                    screenshot_file_path = os.path.join(screenshots_folder_path, screenshot_file)

                    # 检查是否是文件
                    if os.path.isfile(screenshot_file_path):
                        # 写入截图信息到Markdown文档
                        md_file.write(f"  <img src=\"{screenshot_file_path}\" width=\"32%\">\n")

            md_file.write("\n")  # 写入空行，分隔不同的UI设计

print(f"Markdown文档已生成：{output_md_path}")
