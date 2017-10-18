import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
    selector: 'form-mdl',
    templateUrl: 'form-mdl.html',
    styleUrls: const ['form-mdl.css'],
    directives: const [formDirectives],
    pipes: const [JsonPipe])
class FormMDL implements OnInit {
  ControlGroup userForm;

  bool nameValidation = false;

  FormMDL(FormBuilder fb) {
    userForm = fb.group({
      "name": ['', Validators.required],
      "age": new Control(0),
      "genre": [null, Validators.required],
      "newsletter": new Control(true)
    });
  }

  @override
  ngOnInit() {}

  String get value {
    return JSON.encode(userForm.value);
  }

  onSubmit() {
    print('FormMDL.onSubmit » value ${value}');
  }

  /// soit fonction Compo
  /// soit ds template : `f.form.controls['genre'].updateValue('2')`
  updateModel(String propName, String v) {
    (userForm.controls[propName] as Control).updateValue(v);
    print('FormMDL.onSubmit » value ${value}');
    print('FormMDL.updateModel  userForm.valid ${userForm.valid}');
  }
}
