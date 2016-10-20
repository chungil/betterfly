package init;

import java.io.*;

import javax.servlet.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;


public class ConfigServlet  extends GenericServlet{
	@Override
	// ���� �ɾ�ξ����� ȣ���� ��� ���Ǵ� �޼���
	public void service(ServletRequest arg0, ServletResponse arg1) throws ServletException, IOException {
		
	}
	
	@Override
	//init �޼��� :: ���� ��ü ������ �� �� �� ��ü������ ���ȴ�.
	public void init(ServletConfig config) throws ServletException {
		ServletContext context=config.getServletContext();
		//jsp���� application���� �����ִ� ��ü ==> ������ ������ �� �ѹ� ����...���� ���α׷��� ���� �������� ���� ����
		//application.getRealPath(); ==> ��� �۵��ϴ��� ������...
		//session�� ����ڿ��� �ο��Ǵ� ���̰�
		//application�� ���α׷��� �۵��ɶ� �ο��Ǵ� ���̴�.
		try{
			InputStream is=Resources.getResourceAsStream("mybatis/mybatis-config.xml");
			SqlSessionFactory factory=new SqlSessionFactoryBuilder().build(is);
			context.setAttribute("factory", factory);
			context.log("initialized success=====================");
			System.out.println("���� �۵�!!!");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}


