package com.stack.ins.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stack.ins.board.dao.IBoardCategoryRepository;
import com.stack.ins.board.model.BoardCategory;
import com.stack.ins.board.service.IBoardCategoryService;


@Service
public class BoardCategoryService implements IBoardCategoryService{

	@Autowired
	IBoardCategoryRepository boardCategoryRepository;
	
	@Override
	public List<BoardCategory> selectAllCategory() {
		return boardCategoryRepository.selectAllCategory();
	}

	@Override
	public List<BoardCategory> selectAllCategoryByClass1(int class1) {
		return boardCategoryRepository.selectAllCategoryByClass1(class1);
	}

	@Override
	public void insertNewCategory(BoardCategory boardCategory) {
		boardCategoryRepository.insertNewCategory(boardCategory);
	}

	@Override
	public void updateCategory(BoardCategory boardCategory) {
		boardCategoryRepository.updateCategory(boardCategory);
	}

	@Override
	public void deleteCategory(int categoryId) {
		boardCategoryRepository.deleteCategory(categoryId);
	}
}
