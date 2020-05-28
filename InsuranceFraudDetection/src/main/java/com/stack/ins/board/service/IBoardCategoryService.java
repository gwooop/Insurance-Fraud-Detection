package com.stack.ins.board.service;

import java.util.List;

import com.stack.ins.board.model.BoardCategory;

public interface IBoardCategoryService {
	List<BoardCategory> selectAllCategory();
	List<BoardCategory> selectAllCategoryByClass1(int class1);
	void insertNewCategory(BoardCategory boardCategory);
	void updateCategory(BoardCategory boardCategory);
	void deleteCategory(int categoryId);
}
