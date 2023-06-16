package mypack.model;

public class SlideImageModel {
	private int slideId;
	private String slideName;
	private String slideDescription;
	private String slideImage;
	
	public SliderModel slide;
	public SlideImageModel(int slideId, String slideName, String slideDescription, String slideImage,
			SliderModel slide) {
		super();
		this.slideId = slideId;
		this.slideName = slideName;
		this.slideDescription = slideDescription;
		this.slideImage = slideImage;
		this.slide = slide;
	}
	
	public SlideImageModel() {
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

	public String getSlideImage() {
		return slideImage;
	}

	public void setSlideImage(String slideImage) {
		this.slideImage = slideImage;
	}

	public SliderModel getSlide() {
		return slide;
	}

	public void setSlide(SliderModel slide) {
		this.slide = slide;
	}
	
	
}
