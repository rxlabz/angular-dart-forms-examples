import 'dart:convert';
import 'dart:html';

import 'package:angular2/common.dart';
import 'package:angular2/core.dart';

const String API = "http://jsonplaceholder.typicode.com/posts?title_like=";

@Component(
    selector: 'reactive-search',
    templateUrl: 'reactive-search.html',
    styleUrls: const ['reactive-search.css'])
class ReactiveSearch implements OnInit {
  ControlGroup form;


  bool get fNameInvalid => !form.controls['firstname'].valid;

  String get fNameError => fNameInvalid ? 'Ce champ est obligatoire' : '';

  List<dynamic> res;
  Stream<Map<String, String>> re$;

  ReactiveSearch(FormBuilder fb) {
    form = fb.group({
      'firstname': [
        '',
        Validators.compose([Validators.required, Validators.minLength(4)])
      ],
      'lastname': ['', Validators.required],
      'search': '',
    });

    listenSearch();

    form.controls['firstname'].statusChanges.listen((value) {
      print('fname status changed :: $value');
      print('fname status errors :: ${form.controls['firstname'].errors}');
    });
  }

  void listenSearch() {
    var fName$ = form.controls['search'].valueChanges;

    fName$
        .where((String v) => v.length > 3) // q,qu,qua,quas
        .map((String v) => "${API}$v" ) /* "http://jsonplaceholder.typicode.com/posts?title_like=quas"*/
        .asyncMap((v) => HttpRequest.getString(v))
        .map((j) => JSON.decode(j.body))
        .listen((value) => res = value, onError: (err) => print('error $err'));

    fName$.where((String v) => v.length <= 3).listen((e) {
      print('ReactiveSearch.listenSearch  NO_SEARCH');
      if (res != null) res.clear();
    });
  }

  @override
  ngOnInit() {}
}
