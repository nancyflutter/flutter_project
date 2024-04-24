class ExampleModel {
  final String? title;
  final List<DesignModel> designList;

  ExampleModel({
    this.title,
    required this.designList,
  });
}

class DesignModel {
  final String? title;
  final String? codeFile;
  final dynamic screenName;

  DesignModel({
    this.title,
    this.codeFile,
    this.screenName,
  });
}
