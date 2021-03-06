package com.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.model.Article;
import com.model.Good;
import com.model.Page;
import com.model.User;
import com.util.DBUtil;
public class ArticleDao {
	public void addArticle(Article article){

        Connection con = DBUtil.getConnection();
        String sql = "INSERT INTO ARTICLE (user_username, title, image, content,article_number,type,up_time,look,brand) VALUES (?,?,?,?,?,?,?,0,?)";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1,article.getUser_username());
            ps.setString(2,article.getTitle());
            ps.setString(3,article.getImage());
            ps.setString(4,article.getContent());
            ps.setString(5,article.getArticle_number());
            ps.setString(6, article.getType());
            ps.setTimestamp(7,article.getUp_time());
            ps.setString(8, article.getBrand());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(rs);
            DBUtil.close(ps);
            DBUtil.close(con);
        }
    }

	//根据id查找文章
    public Article load(int id){

        Connection con = DBUtil.getConnection();
        String sql = "SELECT * FROM article WHERE id = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        Article article = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next()){
            	article = new Article();
            	article.setId(rs.getInt("id"));
            	article.setArticle_number(rs.getString("article_number"));
            	article.setTitle(rs.getString("title"));
            	article.setImage(rs.getString("image"));
            	article.setContent(rs.getString("content"));
            	article.setUser_username(rs.getString("user_username"));
            	article.setType(rs.getString("type"));
            	article.setBrand(rs.getString("brand"));
            	article.setUp_time(rs.getTimestamp("up_time"));
            	article.setLook(rs.getInt("look"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            DBUtil.close(rs);
            DBUtil.close(ps);
            DBUtil.close(con);
        }
        return article;
    }
    //依托标题名称模糊查询
    public List<Article> load(String name) {
		Connection connection = DBUtil.getConnection();
		String sql = "SELECT * FROM article WHERE title like ?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Article> articles = new ArrayList<Article>();
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, "%"+name+"%");
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
    
  //根据用户查找文章
    public List<Article> loadUser(String username) {
		Connection connection = DBUtil.getConnection();
		String sql = "SELECT * FROM article WHERE user_username=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Article> articles = new ArrayList<Article>();
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			while(rs.next()) {
				Article article = new Article();
				article.setId(rs.getInt("id"));
            	article.setArticle_number(rs.getString("article_number"));
            	article.setTitle(rs.getString("title"));
            	article.setImage(rs.getString("image"));
            	article.setContent(rs.getString("content"));
            	article.setUp_time(rs.getTimestamp("up_time"));
            	article.setLook(rs.getInt("look"));
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
    
    //根据品牌按热度查询
    public List<Article> loadBrand(String brand) {
    	Connection connection = DBUtil.getConnection();
		String sql = "SELECT * from (SELECT  AC.ARTICLE_ID  FROM article a join article_comment ac on a.id=ac.article_id where brand=? GROUP BY ac.ARTICLE_id order by count(ac.ARTICLE_id) DESC) where ROWNUM<13";
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Article> articles = new ArrayList<Article>();
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, brand);
			rs = ps.executeQuery();
			while(rs.next()) {
				String sql1="select * from article where id="+rs.getInt("article_id");
				PreparedStatement ps1 = connection.prepareStatement(sql1);
				ResultSet rs1 = ps1.executeQuery();
				while(rs1.next()) {
				Article article = new Article();
				article.setId(rs1.getInt("id"));
            	//article.setArticle_number(rs.getString("article_number"));
            	article.setTitle(rs1.getString("title"));
            	article.setImage(rs1.getString("image"));
            	article.setContent(rs1.getString("content"));
            	article.setUser_username(rs1.getString("user_username"));
            	article.setType(rs1.getString("type"));
            	article.setLook(rs1.getInt("look"));
            	article.setUp_time(rs1.getTimestamp("up_time"));
            	article.setBrand(rs1.getString("brand"));
				articles.add(article);
				}
				
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
  //根据关键字模糊查询
    public List<Article> load_article_name(String article_name) {
    	Connection connection = DBUtil.getConnection();
		String sql = "select * from article where title like ? or content like ?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Article> articles = new ArrayList<Article>();
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, "%"+article_name+"%");
			ps.setString(2, "%"+article_name+"%");
			rs = ps.executeQuery();
			while(rs.next()) {
				Article article = new Article();
				article.setId(rs.getInt("id"));
            	article.setArticle_number(rs.getString("article_number"));
            	article.setTitle(rs.getString("title"));
            	article.setImage(rs.getString("image"));
            	article.setContent(rs.getString("content"));
            	article.setUser_username(rs.getString("user_username"));
            	article.setType(rs.getString("type"));
            	article.setLook(rs.getInt("look"));
            	article.setUp_time(rs.getTimestamp("up_time"));
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
    //查询所有
    public List<Article> loadAll() {
		Connection connection = DBUtil.getConnection();
		String sql = "SELECT * FROM article order by look desc";
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Article> articles = new ArrayList<Article>();
		try {
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				Article article = new Article();
				article.setId(rs.getInt("id"));
            	article.setArticle_number(rs.getString("article_number"));
            	article.setTitle(rs.getString("title"));
            	article.setImage(rs.getString("image"));
            	article.setContent(rs.getString("content"));
            	article.setUser_username(rs.getString("user_username"));
            	article.setType(rs.getString("type"));
            	article.setLook(rs.getInt("look"));
            	article.setUp_time(rs.getTimestamp("up_time"));
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
  //查询热门文章
    public List<Article> loadHot() {
		Connection connection = DBUtil.getConnection();
		String sql = "SELECT * from (SELECT  AC.ARTICLE_id  FROM article a join article_comment ac on a.id=ac.article_id GROUP BY ac.ARTICLE_id order by count(ac.ARTICLE_id) DESC) where ROWNUM<10";
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Article> articles = new ArrayList<Article>();
		try {
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				String sql1="select * from article where id="+rs.getInt("article_id");
				PreparedStatement ps1 = connection.prepareStatement(sql1);
				ResultSet rs1 = ps1.executeQuery();
				while(rs1.next()) {
				Article article = new Article();
				article.setId(rs1.getInt("id"));
            	//article.setArticle_number(rs.getString("article_number"));
            	article.setTitle(rs1.getString("title"));
            	article.setImage(rs1.getString("image"));
            	article.setContent(rs1.getString("content"));
            	article.setUser_username(rs1.getString("user_username"));
            	article.setType(rs1.getString("type"));
            	article.setLook(rs1.getInt("look"));
            	article.setBrand(rs1.getString("brand"));
            	article.setUp_time(rs1.getTimestamp("up_time"));
				articles.add(article);
				}
				
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
    
  //文章分页、查询所有
	public Page<Article> load(int pageIndex, int pageSize) {
        Page<Article> pager = new  Page<Article>();
        Connection connection = DBUtil.getConnection();
        //创建语句传输对象
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        //准备sql语句
        String sql = "select * from article ";
        //数据总条数
        String  sqlCount = "select count(*) from article";
        //集合中只能放入user对象
        List<Article> articles = new ArrayList<Article>();
        try {
            if (pageIndex <= 0) {
                pageIndex = 1;
            }
            
            int start = (pageIndex-1)*pageSize;
            
//            if (content != null && !"".equals(content)) {
//                sql += " where username like '%" +content+"%'" + "or name like '%" +content + "%'";
//                sqlCount += " where username like '%" +content+"%'" + "or name like '%" +content + "%'";
//            }
            System.out.println(sql);
            preparedStatement = connection.prepareStatement(sqlCount);
            rs = preparedStatement.executeQuery();
            
            //总记录数
            int totalRecord = 0;
            
            while(rs.next()) {
                totalRecord = rs.getInt(1);
            }    
            //总页数
            int totalPage = totalRecord%pageSize == 0 ? totalRecord/pageSize : totalRecord/pageSize + 1;
            
            //加分页
            sql ="select * from (select rownum no,id,user_username,title,image,content,look,up_time,article_number,type,brand from article where rownum<? order by look) where no>=?" ;

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, start+pageSize);
            preparedStatement.setInt(2, start);
            rs = preparedStatement.executeQuery();
            
            //System.out.println(sql+"模糊查询");
            while(rs.next()) {
            	Article article = new Article();
				article.setId(rs.getInt("id"));
            	article.setArticle_number(rs.getString("article_number"));
            	article.setTitle(rs.getString("title"));
            	article.setImage(rs.getString("image"));
            	article.setContent(rs.getString("content"));
            	article.setUser_username(rs.getString("user_username"));
            	article.setType(rs.getString("type"));
            	article.setLook(rs.getInt("look"));
            	article.setBrand(rs.getString("brand"));
            	article.setUp_time(rs.getTimestamp("up_time"));
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
	//文章分页、模糊查询
		public Page<Article> load_article_name(String name,int pageIndex, int pageSize) {
	        Page<Article> pager = new  Page<Article>();
	        Connection connection = DBUtil.getConnection();
	        //创建语句传输对象
	        PreparedStatement preparedStatement = null;
	        ResultSet rs = null;
	        //准备sql语句
	        String sql = "select * from article where title like ? ";
	        //数据总条数
	        String  sqlCount = "select count(*) from article where title like ?";
	        //集合中只能放入user对象
	        List<Article> articles = new ArrayList<Article>();
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
	            preparedStatement.setString(1, "%"+name+"%");
	            rs = preparedStatement.executeQuery();
	            
	            //总记录数
	            int totalRecord = 0;
	            
	            while(rs.next()) {
	                totalRecord = rs.getInt(1);
	            }    
	            //总页数
	            int totalPage = totalRecord%pageSize == 0 ? totalRecord/pageSize : totalRecord/pageSize + 1;
	            
	            //加分页
	            sql ="select * from (select rownum no,id,user_username,title,image,content,look,up_time,article_number,type,brand from article where title like ? and rownum<? order by look) where no>=?" ;

	            preparedStatement = connection.prepareStatement(sql);
	            preparedStatement.setString(1, "%"+name+"%");
	            preparedStatement.setInt(2, start+pageSize);
	            preparedStatement.setInt(3, start);
	            rs = preparedStatement.executeQuery();
	            
	            //System.out.println(sql+"模糊查询");
	            while(rs.next()) {
	            	Article article = new Article();
					article.setId(rs.getInt("id"));
	            	article.setArticle_number(rs.getString("article_number"));
	            	article.setTitle(rs.getString("title"));
	            	article.setImage(rs.getString("image"));
	            	article.setBrand(rs.getString("brand"));
	            	article.setContent(rs.getString("content"));
	            	article.setUser_username(rs.getString("user_username"));
	            	article.setType(rs.getString("type"));
	            	article.setLook(rs.getInt("look"));
	            	article.setUp_time(rs.getTimestamp("up_time"));
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
		
		       //根据用户查询他的所有文章
				public Page<Article> load_article(String username,int pageIndex, int pageSize) {
			        Page<Article> pager = new  Page<Article>();
			        Connection connection = DBUtil.getConnection();
			        //创建语句传输对象
			        PreparedStatement preparedStatement = null;
			        ResultSet rs = null;
			        //准备sql语句
			        String sql = "select * from article where user_username=? ";
			        //数据总条数
			        String  sqlCount = "select count(*) from article where user_username=?";
			        //集合中只能放入user对象
			        List<Article> articles = new ArrayList<Article>();
			        try {
			            if (pageIndex <= 0) {
			                pageIndex = 1;
			            }
			            
			            int start = (pageIndex-1)*pageSize;
			            
//			            if (content != null && !"".equals(content)) {
//			                sql += " where username like '%" +content+"%'" + "or name like '%" +content + "%'";
//			                sqlCount += " where username like '%" +content+"%'" + "or name like '%" +content + "%'";
//			            }
			            System.out.println(sql);
			            preparedStatement = connection.prepareStatement(sqlCount);
			            preparedStatement.setString(1, username);
			            rs = preparedStatement.executeQuery();
			            
			            //总记录数
			            int totalRecord = 0;
			            
			            while(rs.next()) {
			                totalRecord = rs.getInt(1);
			            }    
			            //总页数
			            int totalPage = totalRecord%pageSize == 0 ? totalRecord/pageSize : totalRecord/pageSize + 1;
			            
			            //加分页
			            sql ="select * from (select rownum no,id,user_username,title,image,content,look,up_time,article_number,type,brand from article where user_username=? and rownum<? order by up_time) where no>=?" ;

			            preparedStatement = connection.prepareStatement(sql);
			            preparedStatement.setString(1,username);
			            preparedStatement.setInt(2, start+pageSize);
			            preparedStatement.setInt(3, start);
			            rs = preparedStatement.executeQuery();
			            
			            //System.out.println(sql+"模糊查询");
			            while(rs.next()) {
			            	Article article = new Article();
							article.setId(rs.getInt("id"));
			            	//article.setArticle_number(rs.getString("article_number"));
			            	article.setTitle(rs.getString("title"));
			            	article.setImage(rs.getString("image"));
			            	article.setContent(rs.getString("content"));
			            	article.setUser_username(rs.getString("user_username"));
			            	article.setType(rs.getString("type"));
			            	article.setLook(rs.getInt("look"));
			            	article.setBrand(rs.getString("brand"));
			            	article.setUp_time(rs.getTimestamp("up_time"));
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
				
				//浏览量加一
				public void update(int article_id) {
					// TODO Auto-generated method stub
					Connection connection = DBUtil.getConnection();
					String sql = "UPDATE article SET look=look+1 where id=?";
					PreparedStatement ps = null;
					try {
						ps = connection.prepareStatement(sql);
						ps.setInt(1,article_id);
						ps.executeUpdate();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						DBUtil.close(ps);
						DBUtil.close(connection);
					}
				}
				//删除文章
				public void delete(int article_id) {
					Connection connection = DBUtil.getConnection();
					PreparedStatement preparedStatement = null;
					String sql = "delete from article where id=?";
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
