package mypack.Impl;

import mypack.DAO.ISliderDAO;
import mypack.model.SliderModel;
import mypack.services.ISliderService;

public class SliderServiceImpl implements ISliderService{
	ISliderDAO slideDao = new SliderDAOImpl();
	@Override
	public SliderModel getslide(String slideName) {
		
		return slideDao.getslide(slideName);
	}
	
}
