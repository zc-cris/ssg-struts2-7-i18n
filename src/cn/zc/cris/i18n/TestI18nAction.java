package cn.zc.cris.i18n;

import java.util.Arrays;
import java.util.Date;

import com.opensymphony.xwork2.ActionSupport;

public class TestI18nAction extends ActionSupport {

	
	/**
	 * @Field Name：serialVersionUID
	 * @Description：TODO (用一句话描述这个变量表示什么) 
	 */
	
	private static final long serialVersionUID = 1L;
	private Date date = null;
	
	public Date getDate() {
		return date;
	}

	@Override
	public String execute() throws Exception {
		//在action中访问国际化资源文件的value值
		String username = getText("username");
		String password = getText("password");
		this.date = new Date();
		System.out.println(username +"------"+password);
		//访问带占位符的value值，同时为其赋值
		String time = getText("time", Arrays.asList(this.date));
		System.out.println(time);
		return SUCCESS;
	}

}
