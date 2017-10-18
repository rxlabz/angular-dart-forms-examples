import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
    selector: 'mdinputs',
    templateUrl: 'mdinputs.html',
    styleUrls: const ['mdinputs.css'],
    directives: const [materialDirectives, CORE_DIRECTIVES, formDirectives],
    providers: const [materialProviders],
    pipes: const [JsonPipe])
class MdInputs implements OnInit {
  FormBuilder fb;

  ControlGroup form;

  MdInputs(this.fb);

  String a = '3';

  String get fValue => JSON.encode(form.value);

  @override
  ngOnInit() {
    form = fb.group({
      "age": [
        null,
        Validators.compose([
          Validators.required
          /* TODO numberValidation */
        ])
      ]
    });
  }

  save() {
    form.markAsTouched();
    form.controls['age'].setErrors({'ooops': 'did it again'});
    print('MdInputs.save » fvalue ${fValue}');
  }

  String get ageError => form.controls['age'].errors.toString();
}
