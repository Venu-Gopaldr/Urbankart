package com.app.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CatagoryDTO {

	private String categoryName;
	private String description;
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public CatagoryDTO(String categoryName, String description) {
		super();
		this.categoryName = categoryName;
		this.description = description;
	}
	public CatagoryDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "CatagoryDTO [categoryName=" + categoryName + ", description=" + description + "]";
	}
	
	

}
