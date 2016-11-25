# Angular2 Dart Forms

[Demo](https://rxlabz.github.io/angular-dart-forms-examples/)

- [template based form](https://github.com/rxlabz/angular-dart-forms-examples/tree/master/lib/components/form-tpl)
- [model based form](https://github.com/rxlabz/angular-dart-forms-examples/tree/master/lib/components/form-mdl)
- [reactive form](https://github.com/rxlabz/angular-dart-forms-examples/tree/master/lib/components/reactive-form)
- [reactive search](https://github.com/rxlabz/angular-dart-forms-examples/tree/master/lib/components/reactive-search)
- [dynamic reactive nested form (controlArray)](https://github.com/rxlabz/angular-dart-forms-examples/tree/master/lib/components/dynamic-form)
- [material model form](https://github.com/rxlabz/angular-dart-forms-examples/tree/master/lib/components/mdform-mdl)

## FormTPL : template driven from

### Template

- `#userform="ngForm"`
- `(ngSubmit)="onSubmit()"` : contrôle du submit, bloqué si le form est invalid

- `#name="ngForm" [(ngModel)]="model.name" ngControl=name`
- `#age="ngForm" [ngModel]="model.age" (ngModelChange)="updateAge($event)" ngControl=name`

## FormMDL : Model driven form

## Reactive Form

## Dynamic Form

## Reactive Search

## Material Form



## Material Number input validation