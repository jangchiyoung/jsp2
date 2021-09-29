package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.Comment;
import mybatis.SqlSessionBean;

public class CommentDao {
	private static CommentDao dao = new CommentDao();

	private CommentDao() {
	}

	public static CommentDao getInstance() {
		return dao;
	}

	SqlSessionFactory sqlFactory = SqlSessionBean.getSessionFactory();

	
	public List<Comment> getComments(int mref) {
		List<Comment> list = null;
		SqlSession mapper = sqlFactory.openSession();
		list = mapper.selectList("getcomments", mref);
		mapper.close();
		return list;
	}

	public void insert(Comment dto) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.insert("comment.insert", dto); // mapper xml 파일의 네임스페이스.id 로 첫번째 인자값.
		mapper.commit();
		mapper.close();
	}

	public void updateCommentCnt(int idx) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.update("updateCommentCnt",idx);
		mapper.commit();
		mapper.close();
	}
}
