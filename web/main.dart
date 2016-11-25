// Copyright (c) 2016, rxlabz. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:NGDartForms/app_component.dart';
import 'package:angular2/core.dart';
import 'package:angular2/platform/browser.dart';
import 'package:angular2/platform/common.dart';
import 'package:angular2/router.dart';

main() {
  bootstrap(AppComponent, [
    ROUTER_PROVIDERS,
    APPLICATION_COMMON_PROVIDERS,
    PLATFORM_COMMON_PROVIDERS,
    /*provide(BrowserClient, useFactory: () => new BrowserClient(), deps: []),*/
    provide(APP_BASE_HREF, useValue: '/angular-dart-forms-examples/'),

  ]);
}
