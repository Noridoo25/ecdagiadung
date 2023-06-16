package mypack.Impl;

import java.util.List;

import mypack.DAO.ISlideImageDAO;
import mypack.model.SlideImageModel;

import mypack.services.ISlideImageService;

public class SlideImageServiceImpl implements ISlideImageService {

	ISlideImageDAO slide = new SlideImageDAOImpl();
	
	public List<SlideImageModel> getSlideImage(int id) {
		
		return slide.getSlideImage(id);
	}
}
