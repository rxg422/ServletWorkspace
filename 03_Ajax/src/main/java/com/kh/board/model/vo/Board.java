package com.kh.board.model.vo;

import java.sql.Date;

public class Board {
	
	private String title;
	private String user;
	private String date;
	private String content;
	
	public Board(String title, String user, String date, String content) {
		super();
		this.title = title;
		this.user = user;
		this.date = date;
		this.content = content;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Board [title=" + title + ", user=" + user + ", date=" + date + ", content=" + content + "]";
	}
	
}
