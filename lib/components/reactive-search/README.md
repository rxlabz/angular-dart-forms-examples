# Reactive search form

## map control values to api request result 

- listen to search input changes stream 
  - filter search with less than 4 caracters
  - map to jsonplaceholder api path
  - asyncMap to loaded json string result
  - map to decoded JSON
  
```dart
var fName$ = form.controls['search'].valueChanges;

fName$
    .where((String v) => v.length > 3) // q,qu,qua,quas
    .map((String v) => "${API}$v" ) /* "http://jsonplaceholder.typicode.com/posts?title_like=quas"*/
    .asyncMap((v) => HttpRequest.getString(v))
    .map((j) => JSON.decode(j))
    .listen((value) => res = value, onError: (err) => print('error $err'));

fName$.where((String v) => v.length <= 3).listen((e) {
  if (res != null) res.clear(); // clear results
});
```