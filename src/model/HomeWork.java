package model;

public class HomeWork {
	private int h_id;
	private String subject;
	private String give_time;
	private String submit_time;
	private int u_id;
	private String consignee;
	private String name;
	private String filename;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getH_id() {
		return h_id;
	}

	public void setH_id(int h_id) {
		this.h_id = h_id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getGive_time() {
		return give_time;
	}

	public void setGive_time(String give_time) {
		this.give_time = give_time;
	}

	public String getSubmit_time() {
		return submit_time;
	}

	public void setSubmit_time(String submit_time) {
		this.submit_time = submit_time;
	}

	public int getU_id() {
		return u_id;
	}

	public void setU_id(int u_id) {
		this.u_id = u_id;
	}

	public String getConsignee() {
		return consignee;
	}

	public void setConsignee(String consignee) {
		this.consignee = consignee;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
}
