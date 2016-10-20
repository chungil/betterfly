package mybatis;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionUtil {
   public static SqlSessionFactory factory;
   
   static {   // static �ʵ� �ʱ�ȭ ��ü ���� / ���� ����.
      System.out.print("SqlSessionFactory ���� �Ϸ� ..!");
      try {
         InputStream is = Resources.getResourceAsStream("mybatis/mybatis-config.xml");
         factory = new SqlSessionFactoryBuilder().build(is);
         System.out.println("SUCESS!!");
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   
   public static SqlSession open() {
      return factory.openSession();
   }
}