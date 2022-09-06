package com.kuang.service.Impl;


import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kuang.dao.UploadMapper;
import com.kuang.pojo.Product;
import com.kuang.service.UploadService;
import com.kuang.uitls.AjaxUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UploadServiceImpl implements UploadService {
    @Autowired
    private UploadMapper uploadMapper;
    public void setUploadMapper(UploadMapper uploadMapper){
        this.uploadMapper = uploadMapper;
    }

    public AjaxUtils uploadFile(MultipartFile file) {
            String uploadDocsPath = "D:\\ssm\\ssmbuild\\web\\statics\\upload";
            String fileName = file.getOriginalFilename();
            uploadMapper.uploadFile(fileName,uploadDocsPath);
            File dir = new File(uploadDocsPath,fileName);
            if(!dir.exists()){
                dir.mkdirs();
            }
            try {
                file.transferTo(dir);
                return new AjaxUtils(0,true,"上传成功","");
            } catch (IOException e) {
                return new AjaxUtils(-1,false,"上传失败","");
            }
    }

    public AjaxUtils queryAllFile(int pageNum,int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        Page<Product> file = (Page<Product>) uploadMapper.queryAllFile();
        return new AjaxUtils(true,file.toPageInfo());
    }
}
