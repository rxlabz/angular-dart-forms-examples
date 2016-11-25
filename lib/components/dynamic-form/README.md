# Dynamic nested form

Multi-choices question form

## Dynamic Template driven 

- Form is binded to a QMulti model

```dart
void initQModel() {
  model = new QMulti();
  model.propositions.add(new Proposition(''));
}
```

- new proposition are added to the QMulti model and displayed in the form  

```html
<button (click)="addProp()">new proposition</button>

<div *ngFor="let p of model.propositions; let i = index">
    <input type="text" name="proposition" [(ngModel)]="p.label"
           (key.enter)="addProp()"
           (keydown.backspace)="onBackspaceKey($event.target.value, i)"
           placeholder="Proposition"
           required/>
    <input type="checkbox" name="isCorrect" [(ngModel)]="p.isCorrect"/> correct
    <a href="#" (click)="rmProp(i)">X</a>
</div>
```

```dart
addProp() {
  model.propositions.add(new Proposition(''));
}
```

- to remove a propositions

```dart
rmProp(int propId) {
  model.propositions.removeAt(propId);
}
```

## Reactive Template driven 

- formModel initialisation

```dart
void initFormModel() {
  usersControlArray = new ControlArray([
    new ControlGroup(
      {'label': new Control('aaa'), 'isCorrect': new Control(false)})
  ]);

  questionForm = fb.group({
    'label': ['', Validators.required],
    'propositions': usersControlArray
  });
}
```

- new propositions are added to the FormModel

```html
<button (click)="addPropControl()">new proposition</button>

<div *ngFor="let p of fo.form.controls['propositions'].controls; let i = index">
    <input type="text" name="proposition" [ngFormControl]="p.controls['label']"
           tabindex="{{(i*2)+2}}"
           (key.enter)="addPropControl()"
           (keydown.backspace)="onBackspaceKey($event.target.value, i, true)"
           required/>
    <input type="checkbox" name="isCorrect"
           tabindex="{{(i*2)+3}}"
           [ngFormControl]="p.controls['isCorrect']"/> correct
    <a href="#" (click)="rmPropControl(i)">X</a>
</div>
```

```dart
addPropControl() {
  (questionForm.controls['propositions'] as ControlArray).push(
    new ControlGroup(
        {'label': new Control(''), 'isCorrect': new Control(false)}
        )
  );
}
```

- to remove a proposition

```dart
rmPropControl(int propId) {
    var props = questionForm.controls['propositions'] as ControlArray;
    props.removeAt(propId);

    // todo set focus to next/previous item
}
```