// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListStore on _ListStore, Store {
  Computed<bool>? _$isAddTitleValidComputed;

  @override
  bool get isAddTitleValid =>
      (_$isAddTitleValidComputed ??= Computed<bool>(() => super.isAddTitleValid,
              name: '_ListStore.isAddTitleValid'))
          .value;

  final _$newTodoTitleAtom = Atom(name: '_ListStore.newTodoTitle');

  @override
  String get newTodoTitle {
    _$newTodoTitleAtom.reportRead();
    return super.newTodoTitle;
  }

  @override
  set newTodoTitle(String value) {
    _$newTodoTitleAtom.reportWrite(value, super.newTodoTitle, () {
      super.newTodoTitle = value;
    });
  }

  final _$_ListStoreActionController = ActionController(name: '_ListStore');

  @override
  void setNewTodoTitle(String value) {
    final _$actionInfo = _$_ListStoreActionController.startAction(
        name: '_ListStore.setNewTodoTitle');
    try {
      return super.setNewTodoTitle(value);
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTodo() {
    final _$actionInfo =
        _$_ListStoreActionController.startAction(name: '_ListStore.addTodo');
    try {
      return super.addTodo();
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newTodoTitle: ${newTodoTitle},
isAddTitleValid: ${isAddTitleValid}
    ''';
  }
}
