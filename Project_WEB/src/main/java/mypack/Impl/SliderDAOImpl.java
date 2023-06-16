package mypack.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import ConnectionDB.DBConnection;
import mypack.DAO.ISliderDAO;
import mypack.model.SliderModel;

public class SliderDAOImpl extends DBConnection implements ISliderDAO{
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	@Override
	public SliderModel getslide(String slideName) {
		
		
		String sql = "select * from Slider where slideName = ?";
		
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, slideName);
			rs = ps.executeQuery();
			while(rs.next()) {
				SliderModel slide = new SliderModel();
				slide.setSlideId(rs.getInt("slideId"));
				slide.setSlideName(rs.getString("slideName"));
				slide.setSlideDescription(rs.getString("slideDescription"));
				return slide;

				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
