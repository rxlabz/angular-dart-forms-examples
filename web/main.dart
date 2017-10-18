// Copyright (c) 2016, rxlabz. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:NGDartForms/app_component.dart';
import 'package:angular/angular.dart';
import 'package:angular/core.dart';

main() {
  bootstrap(AppComponent, [
    APPLICATION_COMMON_PROVIDERS,
    /*provide(BrowserClient, useFactory: () => new BrowserClient(), deps: []),*/
    /*provide(APP_BASE_HREF, useValue: '/angular-dart-forms-examples/')*/

  ]);
}
