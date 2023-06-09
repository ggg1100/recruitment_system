package com.nwpu.tag;

import com.nwpu.pojo.Admin;
import com.nwpu.pojo.User;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

/**
 * @author SongYuxuan
 * @Email 3349495429@qq.com
 * @Date 2022-12-13
 * @version 1.0
 * @Description:
 *      自定义Tag标签，用于展示欢迎信息
 */
public class WelcomeTag extends TagSupport {
    private int type;//添加的属性
    public void setType(int type) {
        this.type = type;
    }
    public int doStartTag(){
        if(type==0){
            JspWriter out=pageContext.getOut();
            Admin admin= (Admin) pageContext.getSession().getAttribute("adminSession");
            String html="欢迎管理员："+admin.getName();
            try {
                out.println(html);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else if(type==1){
            JspWriter out=pageContext.getOut();
            User user= (User) pageContext.getSession().getAttribute("userSession");
            String html="欢迎用户："+user.getName();
            try {
                out.println(html);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return SKIP_BODY;
    }

    public int doEndTag() {
        return EVAL_PAGE;
    }
}
