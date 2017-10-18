import 'dart:convert';

import 'package:angular/core.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
    selector: 'md-reactive-form',
    templateUrl: 'md-reactive-form.html',
    styleUrls: const [
      'md-reactive-form.css'
    ],
    directives: const [
      materialDirectives,
      NgForm,
      NgFormControl,
      NgFormModel,
    ],
    providers: const [
      materialProviders
    ],exportAs: "ngForm")
class MdReativeForm implements OnInit {
  ControlGroup form;

  MdReativeForm(FormBuilder fb) {
    form = fb.group({
      "name": ['', Validators.required],
      "age": [
        '',
        Validators.compose([
          Validators.required,
          (AbstractControl c) {
            if (c.value == '') return null;

            var r = new RegExp('[0-9]*');
            if (!r.hasMatch(c.value)) return {'Erreur': 'format incoorect'};

            int.parse(c.value) > 0 ? null : {"incorrect": "numérique attendue"};
          }
        ])
      ],
      "genre": [2, Validators.required],
      "newsletter": new Control(true)
    });
  }

  @override
  ngOnInit() {}

  String get value {
    return JSON.encode(form.value);
  }

  dynamic getModelValue(String propertyName) {
    return form.value[propertyName];
  }

  void onSubmit() {
    print('FormMDL.onSubmit » value ${value}');
  }

  /// soit fonction Compo
  /// soit ds template : `f.form.controls['genre'].updateValue('2')`
  updateModel(String propName, dynamic v) {
    print('FormMDL.updateModel » $propName » v ${v}');
    (form.controls[propName] as Control).updateValue(v);
    print('FormMDL.updateModel » value ${value}');
    print('FormMDL.updateModel  userForm.valid ${form.valid}');
  }
}
