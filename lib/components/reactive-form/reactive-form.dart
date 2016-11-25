import 'package:angular2/common.dart';
import 'package:angular2/core.dart';

@Component(
    selector: 'reactive-form',
    templateUrl: 'reactive-form.html',
    styleUrls: const ['reactive-form.css'])
class ReactiveForm implements OnInit {
  ControlGroup form;

  bool fNameValidation = false;
  bool lNameValidation = false;

  bool get fNameInvalid => !form.controls['firstname'].valid && fNameValidation;

  bool get lNameInvalid => !form.controls['lastname'].valid && lNameValidation;

  String get fNameError => fNameInvalid ? 'Ce champ est obligatoire' : '';

  List<dynamic> res;
  Stream<Map<String, String>> re$;

  ReactiveForm(FormBuilder fb) {
    form = fb.group({
      'firstname': [
        '',
        Validators.compose([Validators.required, ])
      ],
      'lastname': ['', Validators.required],
    });

    form.controls['firstname'].statusChanges.listen((value) {
      print('fname status changed :: $value');
      print('fname status errors :: ${form.controls['firstname'].errors}');
    });
  }

  @override
  ngOnInit() {}
}
