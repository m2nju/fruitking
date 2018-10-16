package kr.ac.hongik.fruitking.notify.dto;
//DTO는 Data Transfer Object로서 DB와의 connection에 비용이 많이 드는 것을 고려해, 한 번의 호출로 data를 서비스하기 위하여 사용.
import java.util.Date;

public class Notify {
	private Long id;
	private String writer;
	private String title;
	private String content;
	private Date regdate;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "Notify [id=" + id + ", writer=" + writer + ", title=" + title + ", content=" + content + ", regdate="
				+ regdate + "]";
	}
}