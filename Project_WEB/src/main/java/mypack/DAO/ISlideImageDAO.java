package mypack.DAO;

import java.util.List;

import mypack.model.SlideImageModel;


public interface ISlideImageDAO {
	List<SlideImageModel> getSlideImage(int id);
}
