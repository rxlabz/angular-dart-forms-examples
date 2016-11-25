import 'dart:convert';
import 'package:angular2/common.dart';
import 'package:angular2/core.dart';
import 'package:angular2_components/angular2_components.dart';

@Component(
    selector: 'mdform-mdl',
    templateUrl: 'mdform-mdl.html',
    styleUrls: const ['mdform-mdl.css'],
    directives: const [materialDirectives],
    providers: const [materialProviders])
class MDFormMDL implements OnInit {
  ControlGroup userForm;

  MDFormMDL(FormBuilder fb) {
    userForm = fb.group({
      "name": ['', Validators.required],
      "age": [
        '',
        Validators.compose([
          Validators.required,
          (AbstractControl c) {
            if (c.value == '') return null;

            var r = new RegExp('[0-9]*');
            if (!r.hasMatch(c.value))
              return {'Erreur': 'format incoorect'};

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
    return JSON.encode(userForm.value);
  }

  dynamic getModelValue(String propertyName) {
    return userForm.value[propertyName];
  }

  onSubmit() {
    print('FormMDL.onSubmit » value ${value}');
  }

  /// soit fonction Compo
  /// soit ds template : `f.form.controls['genre'].updateValue('2')`
  updateModel(String propName, dynamic v) {
    print('FormMDL.updateModel » $propName » v ${v}');
    (userForm.controls[propName] as Control).updateValue(v);
    print('FormMDL.updateModel » value ${value}');
    print('FormMDL.updateModel  userForm.valid ${userForm.valid}');
  }
}
