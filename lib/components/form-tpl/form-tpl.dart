import 'package:NGDartForms/model.dart';
import 'package:angular2/common.dart';
import 'package:angular2/core.dart';

@Component(
    selector: 'form-tpl',
    templateUrl: 'form-tpl.html',
    styleUrls: const['form-tpl.css'],
directives: const[NgForm]
)
class FormTPL implements OnInit{

  User model = new User();

  FormTPL(){}

  @override
  ngOnInit() {
  }

  updateAge(num a){
    model.age = a.toInt();
    //model.age = int.parse(a);
  }

  updateGenre(String g){
    model.genre=int.parse(g);
  }

  onSubmit(){
    print('onSubmit : $model');
  }
}