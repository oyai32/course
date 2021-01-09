package model;

/**
 * 论坛新帖
 * 
 * @author Administrator
 * 
 */
public class Bbs {
	private int bbs_id;
	private String title;
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	private String subject;
	private String content;
	private int u_id;
	private String create_time;
	private String name;

	public int getBbs_id() {
		return bbs_id;
	}

	public void setBbs_id(int bbs_id) {
		this.bbs_id = bbs_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getU_id() {
		return u_id;
	}

	public void setU_id(int u_id) {
		this.u_id = u_id;
	}

	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
}
