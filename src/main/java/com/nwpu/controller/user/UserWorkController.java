package com.nwpu.controller.user;

import com.nwpu.pojo.Application;
import com.nwpu.pojo.Job;
import com.nwpu.pojo.Resume;
import com.nwpu.pojo.User;
import com.nwpu.service.user.UserWorkService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author GengXuelong
 * @version 1.0
 * @Mail 3349495429@qq.com
 * @Date 2022/12/13
 * @ClassName UserWorkController
 * @Description:
 *      实现和user相关的众多具体业务(除登录相关逻辑)
 */
@Controller
public class UserWorkController {

    /**
     * <p> 变量描述如下:
     * @Description:
     *     service层的注入
     */
    @Resource
    UserWorkService userWorkService;

    /**
     * @author GengXuelong
     * <p> 函数功能描述如下:
     * @Description:
     *     实现用户页面中对job的查询
     */
    @RequestMapping("query")
    public String query_impl(String kind,
                             String area,
                             String keyword,
                             Model model){

        List<Job> res;
        res = userWorkService.query(kind,area,keyword);
        List<String> allKindsFromDao = userWorkService.getAllKindsFromDao();
        List<String> allAreasFromDao = userWorkService.getAllAreasFromDao();
        model.addAttribute("jobList",res);
        model.addAttribute("kindList",allKindsFromDao);
        model.addAttribute("areaList",allAreasFromDao);
        return "userPage/userJobInformation";
    }


    /**
     * @author GengXuelong
     * <p> 函数功能描述如下:
     * @Description:
     *      实现对简历的修改
     */
    @RequestMapping("/resume/fix.do")
    public void fix_do(HttpServletRequest request,
                       HttpServletResponse response,
                       String owner_email, String name,
                       int age,int sex,
                       String nation ,String profession,
                       String intention,String school,
                       String phone,String email,
                       String skill,String award,
                       String practice,String description) throws ServletException, IOException {

        Resume resume = new Resume(owner_email,name,sex,nation,age
        ,profession,intention,school,phone,email,skill,award,practice,description);
        int res;
        if(userWorkService.exitUserResume(owner_email)){
            System.out.println("已存在该简历");
             res = userWorkService.updateResumeInDao(resume);
        }else{
            res = userWorkService.addResumeToDao(resume);
        }

        String msg;
        if(res<=0){
            msg = "更新失败，请重试";
        }else{
            msg = "更新成功！";
        }
        request.setAttribute("msg",msg);
        request.getRequestDispatcher("/resume/edit").forward(request,response);
    }


    /**
     * @author GengXuelong
     * <p> 函数功能描述如下:
     * @Description:
     *     实现对职位的申请功能
     */
    @RequestMapping("/jobdetail/application/{jobId}/{email}")
    public void user_jobdetail_application(@PathVariable("jobId")int jobId,
                                           @PathVariable("email")String email,
                                           HttpServletResponse response,
                                           HttpServletRequest request) throws ServletException, IOException {
        User user = new User();
        user.setEmail(email);
        Job job = new Job();
        job.setId(jobId);
        Application application = new Application(0,user,job,"处理中");
        String msg;
        int res =  userWorkService.addApplicationToDao(application);
        if(res>0){
            msg = "恭喜小主，申请成功";
        }else{
            msg = "抱歉小主，由于系统或者网络原因，申请失败.";
        }
        request.setAttribute("msg",msg);
        request.getRequestDispatcher("/jobdetail/"+jobId).forward(request,response);


    }
}
