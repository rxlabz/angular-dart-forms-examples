class Question {
  String label;
  List<Proposition> propositions;

  Question({this.label: '', this.propositions: null}) {
    if (propositions == null) propositions = [];
  }

  Question.fromMap(Map<String, dynamic> data) {
    label = data['label'];
    propositions = (data['propositions'] as List<Map<String, dynamic>>)
        .map((v) => new Proposition.fromMap(v)).toList();
  }

  @override
  String toString() {
    return "Question{ \n"
        "label : $label,\n props : "
        "${propositions.fold(
        '', (String cum, Proposition curr) => cum += curr.toString())} "
        "}";
  }
}

class Proposition {
  String label;
  bool isCorrect;

  Proposition(this.label, {this.isCorrect: false});

  Proposition.fromMap(Map<String, dynamic> data) {
    label = data['label'];
    isCorrect = data['isCorrect'];
  }

  @override
  String toString() {
    return "Proposition { label : $label , isCorrect $isCorrect}";
  }
}

class User {
  String firstName;

  String lastName;
}
