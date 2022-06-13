package myBean.db;

public class WebtoonInfo {
	private int id;
	private String title;
	private String genre;
	private String writer;
	private String writerText;
	private String summary;
	private String uploadImage;
	
	public WebtoonInfo() {}

	public int getId() {
		return id;
	}
	
	public String getTitle() {
		return title;
	}

	public String getGenre() {
		return genre;
	}

	public String getWriter() {
		return writer;
	}

	public String getWriterText() {
		return writerText;
	}

	public String getSummary() {
		return summary;
	}

	public String getUploadImage() {
		return uploadImage;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public void setWriterText(String writerText) {
		this.writerText = writerText;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public void setUploadImage(String uploadImage) {
		this.uploadImage = uploadImage;
	}
	
	
}
