package myBean.db;

public class ContentInfo {
	private int episode;
	private int webtoon;
	private String uploadDate;
	private String title;
	private String uploadThumbnail;
	private String uploadWebtoon;
	
	public ContentInfo() {}

	public int getEpisode() {
		return episode;
	}
	
	public int getWebtoon() {
		return webtoon;
	}

	public String getUploadDate() {
		return uploadDate;
	}

	public String getTitle() {
		return title;
	}

	public String getUploadThumbnail() {
		return uploadThumbnail;
	}

	public String getUploadWebtoon() {
		return uploadWebtoon;
	}

	public void setEpisode(int episode) {
		this.episode = episode;
	}
	
	public void setWebtoon(int webtoon) {
		this.webtoon = webtoon;
	}

	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setUploadThumbnail(String uploadThumbnail) {
		this.uploadThumbnail = uploadThumbnail;
	}

	public void setUploadWebtoon(String uploadWebtoon) {
		this.uploadWebtoon = uploadWebtoon;
	}
	
	
}
