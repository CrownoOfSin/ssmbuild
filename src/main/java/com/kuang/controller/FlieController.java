package com.kuang.controller;



import com.kuang.service.UploadService;
import com.kuang.uitls.AjaxUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;




@Controller
@RequestMapping("/file")
public class FlieController {

    @Autowired
    @Qualifier("uploadServiceImpl")
    private UploadService uploadService;

    @RequestMapping("/toUpload")
    public String toUpload() {
        return "/foreground/fileupload";
    }

    @RequestMapping(value = "/uploadDocs",produces="application/json;charset=utf-8")
    @ResponseBody
    public AjaxUtils uploadDocs(MultipartFile file){
        return uploadService.uploadFile(file);
    }

    @RequestMapping(value = "/getFile/{pageNum}/{pageSize}")
    @ResponseBody
    public AjaxUtils queryFileByPage(@PathVariable("pageNum") int pageNum
                                    ,@PathVariable("pageSize") int pageSize ){
        return uploadService.queryAllFile(pageNum,pageSize);
    }

}
