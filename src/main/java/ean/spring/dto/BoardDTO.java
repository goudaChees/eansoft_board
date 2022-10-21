package ean.spring.dto;

import java.sql.Timestamp;

public class BoardDTO {

	private int seq;
	private String type;
	private String title;
	private String contents;
	private String writer;
	private Timestamp write_date;
	private int file_count;
	private int view_count;
	private int reply_count;
	
	public BoardDTO() {
		// TODO Auto-generated constructor stub
	}

	public BoardDTO(int seq, String type, String title, String contents, String writer, Timestamp write_date,
			int file_count, int view_count, int reply_count) {
		super();
		this.seq = seq;
		this.type = type;
		this.title = title;
		this.contents = contents;
		this.writer = writer;
		this.write_date = write_date;
		this.file_count = file_count;
		this.view_count = view_count;
		this.reply_count = reply_count;
	}

	public BoardDTO(int seq, String type, String title, String contents, String writer, Timestamp write_date,
			int view_count) {
		super();
		this.seq = seq;
		this.type = type;
		this.title = title;
		this.contents = contents;
		this.writer = writer;
		this.write_date = write_date;
		this.view_count = view_count;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Timestamp getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}

	public int getFile_count() {
		return file_count;
	}

	public void setFile_count(int file_count) {
		this.file_count = file_count;
	}

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public int getReply_count() {
		return reply_count;
	}

	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}
	
	
}
