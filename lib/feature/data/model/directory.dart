class DirectoryNode {
  final String name;
  final String path;
  final bool isDirectory;
  bool isExpanded;
  List<DirectoryNode> children;

  DirectoryNode({
    required this.name,
    required this.path,
    required this.isDirectory,
    this.isExpanded = false,
    List<DirectoryNode>? children,
  }) : children = children ?? [];

  List<DirectoryNode> get sortedChildren {
    final directories = children.where((node) => node.isDirectory).toList();
    final files = children.where((node) => !node.isDirectory).toList();

    directories
        .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    files.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

    return [...directories, ...files];
  }

  DirectoryNode copyWith({
    String? name,
    String? path,
    bool? isDirectory,
    bool? isExpanded,
    List<DirectoryNode>? children,
  }) {
    return DirectoryNode(
      name: name ?? this.name,
      path: path ?? this.path,
      isDirectory: isDirectory ?? this.isDirectory,
      isExpanded: isExpanded ?? this.isExpanded,
      children: children ?? this.children,
    );
  }

  DirectoryNode deepCopy({bool? isExpanded}) {
    return DirectoryNode(
      name: name,
      path: path,
      isDirectory: isDirectory,
      isExpanded: isExpanded ?? this.isExpanded,
      children: children.map((child) => child.deepCopy()).toList(),
    );
  }

  DirectoryNode? findNode(String path) {
    if (this.path == path) return this;
    for (final child in children) {
      final found = child.findNode(path);
      if (found != null) return found;
    }
    return null;
  }

  @override
  String toString() => 'DirectoryNode(name: $name, path: $path, '
      'isDirectory: $isDirectory, children: ${children.length})';
}
