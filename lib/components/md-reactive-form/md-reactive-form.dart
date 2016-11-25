import 'package:angular2/core.dart';
import 'package:angular2_components/angular2_components.dart';

@Component(
    selector: 'md-reactive-form',
    templateUrl: 'md-reactive-form.html',
    styleUrls: const['md-reactive-form.css'],
    directives: const [materialDirectives],
    providers: const [materialProviders]
)
class MdReativeForm implements OnInit{

  MdReativeForm(){}

  @override
  ngOnInit() {}
}