package com.kuang.dao;


import com.kuang.pojo.Books;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.awt.print.Book;
import java.util.List;
@Mapper
public interface BookMapper {
    int addBook(Books books);

    int deleteBookById(int id);

    int updateBook(Books books);

    Books queryBookById(int id);

    List<Books> queryAllBook();

    List<Books> queryBookByName(@Param("bookName") String queryBookName);
}
