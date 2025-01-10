class TodoItem {
  final String title;
  final String subtitle;
  final String status;
  final String icon;
  final String screen;

  TodoItem({
    required this.title,
    required this.subtitle,
    required this.status,
    required this.icon,
    required this.screen,
  });

  factory TodoItem.fromJson(Map<String, dynamic> json) {
    return TodoItem(
        title: json['title'],
        subtitle: json['subtile'],
        status: json['status'],
        icon: json['icon'],
        screen: json['screen']);
  }
}
