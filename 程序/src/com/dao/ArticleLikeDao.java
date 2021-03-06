package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Article;
import com.model.ArticleLike;
import com.model.GoodLike;
import com.model.Page;
import com.util.DBUtil;
import com.util.UserException;

public class ArticleLikeDao {
	public void add(ArticleLike articlelike) {
		//获得链接对象
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select count(*) from user_like_article where article_id = ? and user_id=?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, articlelike.getArticle_id());
			preparedStatement.setInt(2, articlelike.getUser_id());
			//接收结果集
			resultSet = preparedStatement.executeQuery();
			//遍历结果集
			while(resultSet.next()) {
				if (resultSet.getInt(1) > 0) {
					throw new UserException("品牌已存在") ;
				}
			}
			
			sql = "INSERT INTO user_like_article(user_id,article_id,article_name,focus_time,brand) VALUES (?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, articlelike.getUser_id());	
			preparedStatement.setInt(2, articlelike.getArticle_id());		
			preparedStatement.setString(3, articlelike.getArticle_name());
			preparedStatement.setString(4, articlelike.getFocus_time());	
			preparedStatement.setString(5, articlelike.getBrand());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//关闭资源
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		
	}
	
	//按用户id查询进行分页
		public Page<ArticleLike> load_article(int user_id, int pageIndex, int pageSize) {
	        Page<ArticleLike> pager = new  Page<ArticleLike>();
	        Connection connection = DBUtil.getConnection();
	        //创建语句传输对象
	        PreparedStatement preparedStatement = null;
	        ResultSet rs = null;
	        //准备sql语句
	        String sql = "select * from user_like_article where user_id=?";
	        //数据总条数
	        String  sqlCount = "select count(*) from user_like_article where user_id=?";
	        //集合中只能放入user对象
	        List<ArticleLike> articles = new ArrayList<ArticleLike>();
	        ArticleLike article = null;
	        try {
	            if (pageIndex <= 0) {
	                pageIndex = 1;
	            }
	            
	            int start = (pageIndex-1)*pageSize;
	            
//	            if (content != null && !"".equals(content)) {
//	                sql += " where username like '%" +content+"%'" + "or name like '%" +content + "%'";
//	                sqlCount += " where username like '%" +content+"%'" + "or name like '%" +content + "%'";
//	            }
	            System.out.println(sql);
	            preparedStatement = connection.prepareStatement(sqlCount);
	            preparedStatement.setInt(1, user_id);
	            rs = preparedStatement.executeQuery();
	            
	            //总记录数
	            int totalRecord = 0;
	            
	            while(rs.next()) {
	                totalRecord = rs.getInt(1);
	            }    
	            //总页数
	            int totalPage = totalRecord%pageSize == 0 ? totalRecord/pageSize : totalRecord/pageSize + 1;
	            
	            //加分页
	            sql ="select * from (select rownum no,id,user_id,article_id from user_like_article where user_id=? and rownum<?) where no>=?" ;

	            preparedStatement = connection.prepareStatement(sql);
	            preparedStatement.setInt(1, user_id);
	            preparedStatement.setInt(2, start+pageSize);
	            preparedStatement.setInt(3, start);
	            rs = preparedStatement.executeQuery();
	            
	            //System.out.println(sql+"模糊查询");
	            while(rs.next()) {
	                article = new ArticleLike();
	                article.setId(rs.getInt("id"));
	                article.setUser_id(rs.getInt("user_id"));
	                article.setArticle_id(rs.getInt("article_id"));      
	                articles.add(article);
	            }    
	            //往分页对象里面设置数据
	            pager.setDatas(articles);
	            pager.setPageIndex(pageIndex);
	            pager.setPageSize(pageSize);
	            pager.setTotalPage(totalPage);
	            pager.setTotalRecord(totalRecord);
	        } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }finally {
	            DBUtil.close(rs);
	            DBUtil.close(preparedStatement);
	            DBUtil.close(connection);
	        }
	        return pager;
	    }
		
		//取消收藏
		public void delete(int user_id,int article_id) {
			Connection connection = DBUtil.getConnection();
			PreparedStatement preparedStatement = null;
			String sql = "delete from user_like_article where user_id=? and article_id=?";
			System.out.print(sql);
			try {
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setInt(1, user_id);
				preparedStatement.setInt(2, article_id);
				preparedStatement.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.close(preparedStatement);
				DBUtil.close(connection);
			}
		}
		
		//协同过滤失败之后，按照文章的品牌和排行榜进行推荐
	    public List<Article> loadRecommend2(int user_id) {
			Connection connection = DBUtil.getConnection();
			String sql = "SELECT * from ARTICLE where BRAND in (SELECT BRAND from (SELECT * FROM USER_LIKE_ARTICLE WHERE user_id=? order by focus_time desc ) where rownum <2)";
			PreparedStatement ps = null;
			ResultSet rs = null;
			List<Article> articles = new ArrayList<Article>();
			try {
				ps = connection.prepareStatement(sql);
				ps.setInt(1, user_id);
				rs = ps.executeQuery();
				while(rs.next()) {
					Article article = new Article();
					article.setId(rs.getInt("id"));
	            	article.setArticle_number(rs.getString("article_number"));
	            	article.setTitle(rs.getString("title"));
	            	article.setImage(rs.getString("image"));
	            	article.setContent(rs.getString("content"));
	            	article.setUp_time(rs.getTimestamp("up_time"));
	            	article.setUser_username(rs.getString("user_username"));
	            	article.setType(rs.getString("type"));
	            	article.setBrand(rs.getString("brand"));
					articles.add(article);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.close(rs);
				DBUtil.close(ps);
				DBUtil.close(connection);
			}
			return articles;
		}
	    
}
