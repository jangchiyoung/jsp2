package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.Comment;
import mybatis.SqlSessionBean;

public class CommentDao {
	private static CommentDao dao = new CommentDao();
	private CommentDao() { }
	public static CommentDao getInstance() {
		return dao;
	}
	
	SqlSessionFactory sqlFactory = SqlSessionBean.getSessionFactory();
	//모든 테이블 데이터 조회
	public List<Comment> getList(int mref) { 
		List<Comment> list = null;
		SqlSession mapper = sqlFactory.openSession();
		list = mapper.selectList("getcomments",mref);  
		mapper.close();
		return list;
	}
	public void intsert(Comment dto) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.insert("comment.insert", dto); //mapper xml 파일에서  네임스페이스.id 로 첫번째 인자 
		mapper.commit();
		mapper.close();
	}
}
