package com.laptrinhjavaweb.util;

import java.util.Map;

public class CategoryUtil {
	
	public static String findCategoryName(String categoryCode, Map<String, String> categoryList) {
		return categoryList.get(categoryCode);
	}
	
}
