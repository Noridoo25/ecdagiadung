package mypack.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ConnectionDB.DBConnection;
import mypack.DAO.ISlideImageDAO;
import mypack.DAO.ISliderDAO;
import mypack.model.SlideImageModel;
import mypack.model.SliderModel;


public class SlideImageDAOImpl extends DBConnection implements ISlideImageDAO{

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	@Override
	public List<SlideImageModel> getSlideImage(int id) {
		
		List<SlideImageModel> slides = new ArrayList<SlideImageModel>();
		String sql = "select Slider.slideId, slideName, slideDescription, slideImage from SliderImage join Slider on SliderImage.slideId = Slider.slideId where Slider.slideId = ?";
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1,id);
			rs = ps.executeQuery();
			while(rs.next()) {
				SlideImageModel slideImage = new SlideImageModel();
				ISliderDAO slide = new SliderDAOImpl();
				slideImage.setSlideId(rs.getInt("slideId"));
				slideImage.setSlideName(rs.getString("slideName"));
				slideImage.setSlideDescription(rs.getString("slideDescription"));
				slideImage.setSlideImage(rs.getString("slideImage"));
				slideImage.setSlide(slide.getslide(rs.getString("slideName")));
				slides.add(slideImage);
			}
			return slides;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
