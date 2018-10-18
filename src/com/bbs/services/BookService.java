package com.bbs.services;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.bbs.dao.BookDao;
import com.bbs.entities.Book;
import com.bbs.entities.Comment;
import com.bbs.entities.User;

public class BookService {
	private BookDao bookDao;

	public void setBookDao(BookDao bookDao) {
		this.bookDao = bookDao;
	}

	public Book bookDetails(Book book) {
		return bookDao.bookDetails(book);
	}

	public List<Book> bookList(Book book, int page) {
		return bookDao.bookList(book, page);
	}

	public List<List<Object>> getBookList() {
		return bookDao.getBookList();
	}

	public int addBookOld(String isbn) {
		return bookDao.addBookOld(isbn);
	}

	public int addBookNew(Book book) {
		return bookDao.addBookNew(book);
	}

	public List<Comment> showComments(Book book) {
		return bookDao.showComments(book);
	}

	public int isFavorited(User user, String bookId) {
		return bookDao.isBookFavorited(user, bookId);
	}

	public int update(Book book) {
		return bookDao.update(book);
	}
	
	public int isExist(String isbn){
		return bookDao.isExist(isbn);
	}

}
