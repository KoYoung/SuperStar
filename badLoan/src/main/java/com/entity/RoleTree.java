package com.entity;

import java.util.List;

public class RoleTree {
	private int id;
	private String text;
	private List<Children> children;
	
	
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public List getChildren() {
		return children;
	}

	public void setChildren(List children) {
		this.children = children;
	}

	@Override
	public String toString() {
		return "RoleTree [id=" + id + ", text=" + text + ", children=" + children + "]";
	}

}
