import 'package:NGDartForms/model.dart';
import 'package:angular/core.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
    selector: 'mdform-mdl',
    templateUrl: 'mdform-mdl.html',
    styleUrls: const ['mdform-mdl.css'],
    directives: const [materialDirectives, formDirectives],
    providers: const [materialProviders])
class MDFormMDL implements OnInit {
  User user;

  bool ageValidation = false;
  bool nameValidation = false;

  MDFormMDL(FormBuilder fb) {
    user = new User();
  }

  String get age {
    return user.age.toString();
  }

  set age(String value) {
    if (value == '') return;

    try {
      user.age = num.parse(value);
    } catch (e) {
      print('MDFormMDL.age... ');
    }
  }

  @override
  ngOnInit() {}

  String get value {
    return user.toString();
  }

  updateAge(e) {
    print('MDFormMDL.updateAge » e ${e}');
  }

  onSubmit() {
    print('FormMDL.onSubmit » value ${value}');
  }

}
