package com.kuang.controller;


import com.kuang.pojo.Books;
import com.kuang.service.BookService;
import com.kuang.uitls.AjaxUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {
    //controller 调 service层
    @Autowired
    @Qualifier("bookServiceImpl")
    private BookService bookService;

    //查询全部书籍，并且返回到一个书籍展示页面
    @RequestMapping("/allBook")
    public String list(Model model){
        return "foreground/allBook";
    }

    @RequestMapping("/ajaxAllBook")
    @ResponseBody
    public AjaxUtils queryBook(){
        List<Books> books = bookService.queryAllBook();
        return new AjaxUtils(books);
    }

    //跳转到增加书籍页面
    @RequestMapping("/toAddBook")
    public String toAddPaper(){
        return "foreground/addBook";
    }
    //添加书籍的请求
    @RequestMapping("/addBook")
    public String addBook(Books books){
        System.out.println("addBook=>"+books);
        bookService.addBook(books);
        //重定向到@RequestMapping("allBook")
        return "redirect:/book/allBook";
    }

    //跳转到修改页面
    @RequestMapping("/toUpdate/{bookId}")
    public String toUpdatePaper(@PathVariable("bookId") int id,Model model){
        Books books = bookService.queryBookById(id);
        model.addAttribute("QBooks",books);
        return "foreground/updateBook";
    }

    //修改书籍
    @RequestMapping("/updateBook")
    public String updateBook(Books books){
        System.out.println("updateBook=>"+books);
        int i = bookService.updateBook(books);
        //重定向到@RequestMapping("allBook")
        return "redirect:/book/allBook";
    }

    //删除书籍
    @RequestMapping("/deleteBook/{bookId}")
    public String deleteBook(@PathVariable("bookId") int id){
        bookService.deleteBookById(id);
        //重定向到@RequestMapping("allBook")
        return "redirect:/book/allBook";
    }

    //查询书籍
   /* @RequestMapping("/queryBook")
    public String queryBook(String queryBookName, Model model){
        List<Books> books = bookService.queryBookByName(queryBookName);
        if(books==null){
            books = bookService.queryAllBook();
            model.addAttribute("error","未查到");
        }
        model.addAttribute("list",books);
        return "foreground/allBook";
    }
*/
    @RequestMapping("/ajaxQueryBook")
    @ResponseBody
    public AjaxUtils queryBook(@RequestParam("bookName") String queryBookName){
        System.out.println("=================="+queryBookName);
        return bookService.queryBookByName(queryBookName);
    }
}
