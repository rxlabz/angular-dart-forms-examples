# Angular2 Dart Forms

- template based form
- model based form
- reactive form
- reactive search
- material model form
- dynamic nested

## FormTPL

### Compo

- `User model;`

### Template

- `#userform="ngForm"`
- `(ngSubmit)="onSubmit()"` : contrôle du submit, bloqué si le form est invalid

- `#name="ngForm" [(ngModel)]="model.name" ngControl=name`
- `#age="ngForm" [ngModel]="model.age" (ngModelChange)="updateAge($event)" ngControl=name`


## FormMDL