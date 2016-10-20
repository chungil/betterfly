package init;

import java.io.*;

import javax.servlet.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;


public class ConfigServlet  extends GenericServlet{
	@Override
	// 매핑 걸어두었을때 호출할 경우 사용되는 메서드
	public void service(ServletRequest arg0, ServletResponse arg1) throws ServletException, IOException {
		
	}
	
	@Override
	//init 메서드 :: 서블릿 객체 생성이 될 때 이 객체까지가 사용된다.
	public void init(ServletConfig config) throws ServletException {
		ServletContext context=config.getServletContext();
		//jsp에서 application으로 잡혀있는 객체 ==> 서버가 켜질때 딱 한번 생성...이후 프로그램에 대한 전반적인 제어 역할
		//application.getRealPath(); ==> 어디서 작동하는지 절대경로...
		//session은 사용자에게 부여되는 것이고
		//application은 프로그램이 작동될때 부여되는 것이다.
		try{
			InputStream is=Resources.getResourceAsStream("mybatis/mybatis-config.xml");
			SqlSessionFactory factory=new SqlSessionFactoryBuilder().build(is);
			context.setAttribute("factory", factory);
			context.log("initialized success=====================");
			System.out.println("서버 작동!!!");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}


