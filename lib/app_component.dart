// Copyright (c) 2016, rxlabz. All rights reserved. Use of this source code

// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:NGDartForms/components/dynamic-form/dynamic-form.dart';
import 'package:NGDartForms/components/forms_demo.dart';
import 'package:NGDartForms/components/mdinputs/mdinputs.dart';
import 'package:angular2/core.dart';
import 'package:angular2_components/angular2_components.dart';

@Component(
    selector: 'my-app',
    styleUrls: const ['app_component.css'],
    templateUrl: 'app_component.html',
    providers: const [materialProviders],
    directives: const [
      materialDirectives,
      FormTPL,
      FormMDL,
      ReactiveForm,
      ReactiveSearch,
      MDFormMDL,
      MdInputs,
      DynForm
    ])
class AppComponent {}
