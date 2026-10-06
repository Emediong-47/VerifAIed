enum LivenessAction {
  lookLeft('Look Left'),
  lookRight('Look Right'),
  lookUp('Look Up'),
  lookDown('Look Down'),
  smile('Smile');

  const LivenessAction(this.label);

  final String label;
}
