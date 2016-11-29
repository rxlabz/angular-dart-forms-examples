import 'package:NGDartForms/model.dart';
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
