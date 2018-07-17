package model.bean;

public class Skills {
	private int skillId;
	private String name;
	private int courseId;
	
	public int getSkillId() {
		return skillId;
	}
	public void setSkillId(int skillId) {
		this.skillId = skillId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getcourseId(){
		return courseId;
	}
	public void setCourseId(int courseId){
		this.courseId = courseId;
	}
	public Skills(int skillId, String name, int courseId) {
		super();
		this.skillId = skillId;
		this.name = name;
		this.courseId = courseId;
	}
	public Skills() {
		super();
	}

}
