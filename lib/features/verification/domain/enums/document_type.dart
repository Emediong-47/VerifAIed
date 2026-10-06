enum DocumentType {
  nin('NIN'),
  studentId('Student ID Card'),
  votersCard("Voter's Card");

  const DocumentType(this.label);

  final String label;
}
