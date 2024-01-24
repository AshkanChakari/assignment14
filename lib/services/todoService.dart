import 'package:assignment14/model/todo.dart';
import 'package:assignment14/DB/repository.dart';

class TodoService{
  Repository _repository;

  TodoService():_repository = Repository();


  saveTodo(Todo todo) async {
    return await _repository.insertData("todos", todo.todoMap());
  }
}