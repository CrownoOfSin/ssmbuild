package com.kuang.dao;

import com.kuang.pojo.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UploadMapper {
    /**
     * 文件上传
     * @param fileName
     * @param filePath
     * @return
     */
    int uploadFile(@Param("fileName")String fileName,@Param("filePath") String filePath);

    List<Product> queryAllFile();

}
