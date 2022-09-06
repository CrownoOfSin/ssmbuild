package com.kuang.service;

import com.kuang.pojo.Books;
import com.kuang.uitls.AjaxUtils;


import java.util.List;

public interface BookService {
    int addBook(Books books);

    int deleteBookById(int id);

    int updateBook(Books books);

    Books queryBookById(int id);

    List<Books> queryAllBook();

    AjaxUtils queryBookByName(String queryBookName);
}
