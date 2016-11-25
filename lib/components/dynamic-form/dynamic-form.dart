import 'package:angular2/common.dart';
import 'package:angular2/core.dart';

@Component(
    selector: 'dynamic-form',
    templateUrl: 'dynamic-form.html',
    styleUrls: const ['dynamic-form.css'])
class DynForm implements OnInit {
  QMulti model;

  FormBuilder fb;

  ControlGroup questionForm;

  ControlArray usersControlArray;

  String get formQ => new QMulti.fromMap(questionForm.value).toString();

  DynForm(FormBuilder this.fb) {
    initQModel();

    initFormModel();
  }

  void initFormModel() {
    usersControlArray = new ControlArray([
      new ControlGroup(
          {'label': new Control('aaa'), 'isCorrect': new Control(false)})
    ]);

    questionForm = fb.group({
      'label': ['', Validators.required],
      'propositions': usersControlArray
    });
  }

  void initQModel() {
    model = new QMulti();
    model.propositions.add(new Proposition(''));
  }

  @override
  ngOnInit() {}

  addProp() {
    model.propositions.add(new Proposition(''));
  }

  addPropControl() {
    (questionForm.controls['propositions'] as ControlArray).push(
        new ControlGroup(
            {'label': new Control(''), 'isCorrect': new Control(false)}));
  }

  rmProp(int propId) {
    model.propositions.removeAt(propId);
  }

  rmPropControl(int propId) {
    var props = questionForm.controls['propositions'] as ControlArray;
    props.removeAt(propId);

    // todo transmit focus to last item
    /*if( props.controls.length > 0 )
      (props.at(props.controls.length-1) as ControlGroup).find('label').*/
  }

  onBackspaceKey(String content, int propId, [bool isModelDriven = false]) {
    if (content.length == 0)
      if (!isModelDriven)
        rmProp(propId);
      else
        rmPropControl(propId);
  }

}

class QMulti {
  String label;
  List<Proposition> propositions;

  QMulti({this.label: '', this.propositions: null}) {
    if (propositions == null) propositions = [];
  }

  QMulti.fromMap(Map<String, dynamic> data) {
    label = data['label'];
    propositions = (data['propositions'] as List<Map<String, dynamic>>)
        .map((v) => new Proposition.fromMap(v)).toList();
  }

  @override
  String toString() {
    return "QMulti{ \n"
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
