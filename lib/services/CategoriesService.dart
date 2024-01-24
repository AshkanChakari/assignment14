import 'package:assignment14/DB/repository.dart';

import '../model/Category.dart';

class CategoryService {
  Repository _repository;

  CategoryService() : _repository = Repository(); // Initialize _repository in the constructor

  //Create Data
  Future<int> saveCategory(Category category) async {
    return await _repository.insertData("categories", category.categoryMap());
  }

  //Read data from table
  Future<List<Map<String, dynamic>>> readCategories() async {
    return await _repository.readData("categories");
  }
  //Read data from table by Id
  readCategoriesById(categoryId) async {
    return await _repository.readDataById("categories", categoryId);
  }

  // Update data from table
  updateCategory(Category category) async {
    return await _repository.updateData("categories" , category.categoryMap());
  }

  //Delete data from table
  deleteCategory(categoryId) async {
    return await _repository.deleteData("categories" , categoryId);
  }
}