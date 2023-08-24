enum ApiParam {
  current,
}

extension ApiParamNameExtension on ApiParam {
  get current => ApiParam.current.name;
}
