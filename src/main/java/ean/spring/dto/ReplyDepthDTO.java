package ean.spring.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ReplyDepthDTO {
	
	private int seq;
	private String writer;
	private String contents;
	private Timestamp write_date;
	private int parent_reply_seq;
	private int board_seq;
	
	public ReplyDepthDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReplyDepthDTO(int seq, String writer, String contents, Timestamp write_date, int parent_reply_seq,
			int board_seq) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.contents = contents;
		this.write_date = write_date;
		this.parent_reply_seq = parent_reply_seq;
		this.board_seq = board_seq;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Timestamp getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}

	public int getParent_reply_seq() {
		return parent_reply_seq;
	}

	public void setParent_reply_seq(int parent_reply_seq) {
		this.parent_reply_seq = parent_reply_seq;
	}

	public int getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}
	
	public String getFormed_WriteDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd hh:mm");
		return sdf.format(this.write_date);
	}

}
