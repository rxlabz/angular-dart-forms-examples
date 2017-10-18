// Copyright (c) 2016, rxlabz. All rights reserved. Use of this source code

// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:NGDartForms/components/dynamic-form/dynamic-form.dart';
import 'package:NGDartForms/components/forms_demo.dart';
import 'package:NGDartForms/components/mdinputs/mdinputs.dart';
import 'package:angular/core.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
    selector: 'my-app',
    styleUrls: const ['app_component.css'],
    templateUrl: 'app_component.html',
    providers: const [materialProviders, FormBuilder],
    directives: const [
      materialDirectives,
      formDirectives,
      NgForm, NgFormModel,
      NgFormControl,
      FormTPL,
      FormMDL,
      ReactiveForm,
      ReactiveSearch,
      MDFormMDL,
      DynForm,
      /*
      MdInputs,
      */
    ])
class AppComponent {}
