import 'package:angular2/common.dart';
import 'package:angular2/core.dart';
import 'package:angular2_components/angular2_components.dart';

@Component(
    selector: 'mdinputs',
    templateUrl: 'mdinputs.html',
    styleUrls: const ['mdinputs.css'],
    directives: const [materialDirectives],
    providers: const [materialProviders])
class MdInputs implements OnInit {

  ControlGroup form;

  MdInputs(FormBuilder fb) {
    form = fb.group({
      "age" : [0,Validators.required]
    });


  }

  @override
  ngOnInit() {}
}
