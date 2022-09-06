package com.kuang.service;

import com.kuang.pojo.Product;
import com.kuang.uitls.AjaxUtils;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

/**
 * @author Admin
 */
public interface UploadService {
    /**
     * 文件上传
     * @param file
     * @return
     */
    AjaxUtils uploadFile(MultipartFile file);

    /**
     * 查询上传文件
     * @param pageNum 当前页码
     * @param pageSize  每页条数
     * @return
     */
    AjaxUtils queryAllFile(int pageNum,int pageSize);
}
