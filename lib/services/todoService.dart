import 'package:assignment14/model/todo.dart';
import 'package:assignment14/DB/repository.dart';

class TodoService{
  Repository _repository;

  TodoService():_repository = Repository();

  //Create todos
  saveTodo(Todo todo) async {
    return await _repository.insertData("todos", todo.todoMap());
  }

  //read todos
  readTodos() async {
    return await _repository.readData("todos");
  }


}