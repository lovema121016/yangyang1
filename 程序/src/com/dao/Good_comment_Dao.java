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

public class Good_comment_Dao {
	//添加评论
	public void addComment(Good_comment comment){

        Connection con = DBUtil.getConnection();
        String sql = "INSERT INTO good_comment (good_number, username, content, up_time) VALUES (?,?,?,?)";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1,comment.getGood_id());
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
	//根据商品编号查找
	public List<Good_comment> load(int good_id) {
		Connection connection = DBUtil.getConnection();
		String sql = "SELECT * FROM good_comment where good_id=? and rownum<=12";
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Good_comment> article_comments = new ArrayList<Good_comment>();
		try {
			ps = connection.prepareStatement(sql);
			ps.setInt(1, good_id);
			rs = ps.executeQuery();
			while(rs.next()) {
				Good_comment article_comment = new Good_comment();
				article_comment.setId(rs.getInt("id"));
				article_comment.setGood_id(rs.getInt("good_id"));
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
}
