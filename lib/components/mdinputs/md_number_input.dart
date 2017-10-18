import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
    selector: 'mdinputs',
    templateUrl: 'mdinputs.html',
    styleUrls: const ['mdinputs.css'],
    directives: const [materialDirectives, formDirectives],
    providers: const [materialProviders],
    pipes: const [JsonPipe])
class MdInputs implements OnInit {
  ControlGroup form;

  String a = '3';

  String get fValue => JSON.encode(form.value);

  MdInputs(FormBuilder fb) {
    form = fb.group({
      "age": [0, Validators.required]
    });
  }

  @override
  ngOnInit() {}

  save() {
    print('MdInputs.save... ');
  }
}
