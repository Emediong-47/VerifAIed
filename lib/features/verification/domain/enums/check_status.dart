enum CheckStatus {
  passed,
  passedWithWarning,
  failed,
  notCompleted;

  bool get isPassed => this == passed || this == passedWithWarning;
}
