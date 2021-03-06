package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Article;
import com.model.Article_comment;
import com.model.Good_comment;
import com.util.DBUtil;

public class Article_comment_Dao {
	
	//根据文章编号查询评论
	public List<Article_comment> load(int article_id) {
		Connection connection = DBUtil.getConnection();
		String sql = "SELECT * FROM article_comment where article_id=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Article_comment> article_comments = new ArrayList<Article_comment>();
		try {
			ps = connection.prepareStatement(sql);
			ps.setInt(1, article_id);
			rs = ps.executeQuery();
			while(rs.next()) {
				Article_comment article_comment = new Article_comment();
				article_comment.setId(rs.getInt("id"));
				article_comment.setArticle_id(rs.getInt("article_id"));
				article_comment.setUsername(rs.getString("username"));
            	article_comment.setContent(rs.getString("content"));
            	article_comment.setUp_time(rs.getString("up_time"));
				article_comments.add(article_comment);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(rs);
			DBUtil.close(ps);
			DBUtil.close(connection);
		}
		return article_comments;
	}
	
	//添加评论
		public void addComment(Article_comment comment){

	        Connection con = DBUtil.getConnection();
	        String sql = "INSERT INTO article_comment (article_id, username, content, up_time) VALUES (?,?,?,?)";
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        try {
	            ps = con.prepareStatement(sql);
	            ps.setInt(1,comment.getArticle_id());
	            ps.setString(2,comment.getUsername());
	            ps.setString(3,comment.getContent());
	            ps.setString(4,comment.getUp_time());
	            //ps.setDate(7,(Date) article.getUp_time());
	            ps.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }finally {
	            DBUtil.close(rs);
	            DBUtil.close(ps);
	            DBUtil.close(con);
	        }
	    }
		  //删除该文章的所有删除评论
		 public void delete(int article_id) {
					Connection connection = DBUtil.getConnection();
					PreparedStatement preparedStatement = null;
					String sql = "delete from article_comment where article_id=?";
					System.out.print(sql);
					try {
						preparedStatement = connection.prepareStatement(sql);
						preparedStatement.setInt(1, article_id);
						preparedStatement.executeUpdate();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						DBUtil.close(preparedStatement);
						DBUtil.close(connection);
					}
				}
}
