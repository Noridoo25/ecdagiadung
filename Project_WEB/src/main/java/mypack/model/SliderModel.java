package mypack.model;

public class SliderModel {
	private int slideId;
	private String slideName;
	private String slideDescription;
	public SliderModel(int slideId, String slideName, String slideDescription) {
		super();
		this.slideId = slideId;
		this.slideName = slideName;
		this.slideDescription = slideDescription;
	}
	public SliderModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getSlideId() {
		return slideId;
	}
	public void setSlideId(int slideId) {
		this.slideId = slideId;
	}
	public String getSlideName() {
		return slideName;
	}
	public void setSlideName(String slideName) {
		this.slideName = slideName;
	}
	public String getSlideDescription() {
		return slideDescription;
	}
	public void setSlideDescription(String slideDescription) {
		this.slideDescription = slideDescription;
	}
	
	
}
