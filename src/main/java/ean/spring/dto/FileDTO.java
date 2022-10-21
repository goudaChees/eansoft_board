package ean.spring.dto;

public class FileDTO {
	
	private int seq;
	private String ori_Name;
	private String sys_Name;
	private int parent_Seq;
	
	public FileDTO() {
		// TODO Auto-generated constructor stub
	}

	public FileDTO(int seq, String ori_Name, String sys_Name, int parent_Seq) {
		super();
		this.seq = seq;
		this.ori_Name = ori_Name;
		this.sys_Name = sys_Name;
		this.parent_Seq = parent_Seq;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getOri_Name() {
		return ori_Name;
	}

	public void setOri_Name(String ori_Name) {
		this.ori_Name = ori_Name;
	}

	public String getSys_Name() {
		return sys_Name;
	}

	public void setSys_Name(String sys_Name) {
		this.sys_Name = sys_Name;
	}

	public int getParent_Seq() {
		return parent_Seq;
	}

	public void setParent_Seq(int parent_Seq) {
		this.parent_Seq = parent_Seq;
	}
	
	

}
