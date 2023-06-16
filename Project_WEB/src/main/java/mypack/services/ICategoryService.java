package mypack.services;

import java.util.List;

import mypack.model.CategoryModel;

public interface ICategoryService {
	void insert(String category);
	void edit(int categoryId, String categoryName);
	void delete(int categoryId);
	void reset(int categoryId );
	List<CategoryModel> getAll();
	CategoryModel getCategoryById(int id);
}
