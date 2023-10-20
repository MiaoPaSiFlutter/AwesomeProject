/// 更新App版本事件
class UpdateAppEvent {
  final String? from;
  final String? version;
  final String? title;
  final List? description;
  final bool? forcedUpdate;
  final String? link;

  UpdateAppEvent({
    this.from,
    this.version,
    this.title,
    this.description,
    this.forcedUpdate,
    this.link,
  });

  @override
  String toString() {
    return "UpdateAppEvent {from: $from, version: $version, title: $title, description: $description, forcedUpdate: $forcedUpdate, link: $link}";
  }
}
