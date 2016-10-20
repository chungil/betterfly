package mybatis;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionUtil {
   public static SqlSessionFactory factory;
   
   static {   // static 필드 초기화 객체 생성 / 값을 설정.
      System.out.print("SqlSessionFactory 생성 완료 ..!");
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