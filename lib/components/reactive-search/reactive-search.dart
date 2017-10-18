import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:angular_forms/angular_forms.dart';

const String API = "https://jsonplaceholder.typicode.com/posts?title_like=";

@Component(
    selector: 'reactive-search',
    templateUrl: 'reactive-search.html',
    styleUrls: const ['reactive-search.css'],
    pipes: const [JsonPipe],
    directives: const [CORE_DIRECTIVES, formDirectives])
class ReactiveSearch implements OnInit {
  ControlGroup form;

  bool get fNameInvalid => !form.controls['firstname'].valid;

  String get fNameError => fNameInvalid ? 'Ce champ est obligatoire' : '';

  List<dynamic> res;
  Stream<Map<String, String>> re$;

  ReactiveSearch(FormBuilder fb) {
    form = fb.group({
      'search': '',
    });


  }

  void listenSearch() {
    var search$ = form.controls['search'].valueChanges;

    search$
        .where((String v) => v.length > 3) // q,qu,qua,quas
        .map((String v) =>
            "${API}$v") /* "http://jsonplaceholder.typicode.com/posts?title_like=quas"*/
        .asyncMap((v) => HttpRequest.getString(v))
        .map((j) => JSON.decode(j))
        .listen((value) => res = value, onError: (err) => print('error $err'));

    search$.where((String v) => v.length <= 3).listen((e) {
      if (res != null) res.clear(); // clear results
    });
  }

  @override
  ngOnInit() {
    listenSearch();
  }
}
