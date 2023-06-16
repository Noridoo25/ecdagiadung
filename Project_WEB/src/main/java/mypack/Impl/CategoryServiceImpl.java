package mypack.Impl;

import java.util.List;

import mypack.DAO.ICategoryDAO;
import mypack.model.CategoryModel;
import mypack.services.ICategoryService;

public class CategoryServiceImpl implements ICategoryService{

	ICategoryDAO categoryService = new CategoryDAOImpl();
	@Override
	public void insert(String category) {
		
		categoryService.insert(category);
	}
	@Override
	public List<CategoryModel> getAll() {
		
		return categoryService.getAll();
	}
	@Override
	public void edit(int categoryId,String categoryName) {
		
		categoryService.edit(categoryId, categoryName);
	}
	@Override
	public CategoryModel getCategoryById(int id) {
		
		return categoryService.getCategoryById(id);
	}
	@Override
	public void delete(int categoryId) {
		
		categoryService.delete(categoryId);
	}
	@Override
	public void reset(int categoryId) {
		
		categoryService.reset(categoryId);
	}
	
}
