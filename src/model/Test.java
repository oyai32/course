package model;

/**
 * 试卷
 * 
 * @author Administrator
 * 
 */
public class Test {
	private String test_id;
	private String alltopic;
	public String getTest_id() {
		return test_id;
	}
	public void setTest_id(String test_id) {
		this.test_id = test_id;
	}
	public String getAlltopic() {
		return alltopic;
	}
	public void setAlltopic(String alltopic) {
		this.alltopic = alltopic;
	}
	public String getAllanswer() {
		return allanswer;
	}
	public void setAllanswer(String allanswer) {
		this.allanswer = allanswer;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	private String allanswer;
	private int u_id;
	private String subject;
	private String difficulty;
	private String create_time;
}
