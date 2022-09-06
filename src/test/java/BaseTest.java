import com.kuang.dao.UploadMapper;
import com.kuang.service.UploadService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration("src/main/resources")
@ContextConfiguration(locations = { "classpath:applicationContext.xml",
        "classpath:mybatis-config.xml" })
public class BaseTest {

    @Resource
    private UploadMapper uploadMapper;

    @Autowired
    private UploadService uploadService;

    @Test
    public void test() {
        System.out.println(uploadService.queryAllFile(1,5));
    }
}

