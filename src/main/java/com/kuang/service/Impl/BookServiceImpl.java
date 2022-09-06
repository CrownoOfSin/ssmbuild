package com.kuang.service.Impl;

import com.kuang.dao.BookMapper;
import com.kuang.pojo.Books;
import com.kuang.service.BookService;
import com.kuang.uitls.AjaxUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    //service 调dao层：组合Dao
    @Autowired
    private BookMapper bookMapper;
    public void setBookMapper(BookMapper bookMapper){
        this.bookMapper = bookMapper;
    }

    public int addBook(Books books) {
        return bookMapper.addBook(books);
    }

    public int deleteBookById(int id) {
        return bookMapper.deleteBookById(id);
    }

    public int updateBook(Books books) {
        return bookMapper.updateBook(books);
    }

    public Books queryBookById(int id) {
        return bookMapper.queryBookById(id);
    }

    public List<Books> queryAllBook() {
        return bookMapper.queryAllBook();
    }

    public AjaxUtils queryBookByName(String queryBookName) {
        List<Books> list = bookMapper.queryBookByName(queryBookName);
        if (list.size()==0){
            list = bookMapper.queryAllBook();
            return new AjaxUtils(false,"没有符合的结果",list);
        }
        return new AjaxUtils(true,list);
    }
}
