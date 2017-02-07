import 'dart:convert';

import 'package:angular2/common.dart';
import 'package:angular2/core.dart';
import 'package:angular2_components/angular2_components.dart';

@Component(
    selector: 'mdinputs',
    templateUrl: 'mdinputs.html',
    styleUrls: const ['mdinputs.css'],
    directives: const [materialDirectives, CORE_DIRECTIVES],
    providers: const [materialProviders])
class MdInputs implements OnInit {

  FormBuilder fb;

  ControlGroup form;

  MdInputs(this.fb);

  String a = '3';

  String get fValue => JSON.encode(form.value);

  @override
  ngOnInit() {
    form = fb.group({
      "age" : [null, Validators.compose([Validators.required
        /* TODO numberValidation */
      ])
      ]
    });
  }

  save(){
    form.markAsTouched();
    form.controls['age'].setErrors({'ooops':'did it again'});
    print('MdInputs.save » fvalue ${fValue}');
  }

  String get ageError => form.controls['age'].errors.toString() ;

}
