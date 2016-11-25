import 'package:NGDartForms/model.dart';
import 'package:angular2/common.dart';
import 'package:angular2/core.dart';


/**
 * a user instance model binded to template driven form
 */

@Component(
    selector: 'form-tpl',
    templateUrl: 'form-tpl.html',
    styleUrls: const['form-tpl.css'],
directives: const[NgForm]
)
class FormTPL implements OnInit{

  User model = new User();

  bool nameValidation = false;

  FormTPL(){}

  @override
  ngOnInit() {
  }

  updateAge(num a){
    model.age = a.toInt();
  }

  updateGenre(String g){
    model.genre=int.parse(g);
  }

  validateName() {
    nameValidation = true;
  }

  onSubmit(){
    print('onSubmit : $model');
  }
}