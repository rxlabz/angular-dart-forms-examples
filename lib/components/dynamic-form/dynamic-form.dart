import 'package:NGDartForms/components/dynamic-form/question.dart';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
    selector: 'dynamic-form',
    templateUrl: 'dynamic-form.html',
    styleUrls: const [
      'dynamic-form.css'
    ],
    directives: const [
      formDirectives,
      CORE_DIRECTIVES,
      NgFor,
      NgForm,
      NgModel,
      NgFormModel,
      NgFormControl,
    ],
    pipes: const [
      JsonPipe
    ])
class DynForm implements OnInit {
  Question model;

  FormBuilder fb;

  ControlGroup questionForm;

  ControlArray usersControlArray;

  String get formQ => new Question.fromMap(questionForm.value).toString();

  List<AbstractControl> get controls => usersControlArray.controls;

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
    model = new Question();
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
  }

  onBackspaceKey(String content, int propId, [bool isModelDriven = false]) {
    if (content.length == 0) if (!isModelDriven)
      rmProp(propId);
    else
      rmPropControl(propId);
  }
}
