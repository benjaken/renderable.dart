class Mirror {
  final String name;
  final Function callback;
  const Mirror({
    this.name,
    this.callback,
  });
}

const Mirror mirror = const Mirror(name: "No Name");
