import 'dart:convert';
import 'package:angular2/common.dart';
import 'package:angular2/core.dart';
import 'package:angular2_components/angular2_components.dart';

@Component(
    selector: 'mdinputs',
    templateUrl: 'mdinputs.html',
    styleUrls: const ['mdinputs.css'],
    directives: const [materialDirectives, MaterialNumberInputValidatorDirective],
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
      "age" : [null,Validators.compose( [Validators.required,  (AbstractControl c){
        print('Validate number   ${c.value}');
        String valRes = new NumberValidator(false, false, 1, 100, 'err').call(c.value.toString());
        if(valRes != null) return {"Erreur":valRes};
        return null;
      }])]
    });
  }

  save(){
    form.markAsTouched();
    form.controls['age'].setErrors({'ooops':'did it again'});
    print('MdInputs.save » fvalue ${fValue}');
  }

  String get ageError => form.controls['age'].errors.toString() ;

}
