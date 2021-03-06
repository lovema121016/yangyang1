package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Brand;
import com.model.Count;
import com.model.Good;
import com.model.GoodLike;
import com.model.Page;
import com.util.DBUtil;
import com.util.UserException;

public class GoodLikeDao {
	public void add(GoodLike goodlike) {
		//获得链接对象
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select count(*) from user_like_good where good_id = ? and user_id=?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, goodlike.getGood_id());
			preparedStatement.setInt(2, goodlike.getUser_id());
			//接收结果集
			resultSet = preparedStatement.executeQuery();
			//遍历结果集
			while(resultSet.next()) {
				if (resultSet.getInt(1) > 0) {
					throw new UserException("品牌已存在") ;
				}
			}
			
			sql = "INSERT INTO user_like_good(user_id,good_id,good_name,focus_time,brand) VALUES (?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, goodlike.getUser_id());	
			preparedStatement.setInt(2, goodlike.getGood_id());		
			preparedStatement.setString(3, goodlike.getGood_name());
			preparedStatement.setString(4, goodlike.getFocus_time());	
			preparedStatement.setString(5, goodlike.getBrand());
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
	
	
	//统计每年月品牌关注用户数
		public List<Count> load(String brand,String year) {
			Connection connection = DBUtil.getConnection();
			String sql ="select COUNT(*) as cout,focus_time from USER_LIKE_GOOD where BRAND=? and focus_time like ? GROUP BY FOCUS_TIME";
			PreparedStatement ps = null;
			ResultSet rs = null;
			List<Count> counts = new ArrayList<Count>();
			try {
				ps = connection.prepareStatement(sql);
				ps.setString(1, brand);
				ps.setString(2, year+"%");
				rs = ps.executeQuery();
				while(rs.next()) {
					Count count = new Count();
					count.setCount(rs.getInt("cout"));
					count.setDate(rs.getString("focus_time"));
	            	counts.add(count);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.close(rs);
				DBUtil.close(ps);
				DBUtil.close(connection);
			}
			return counts;
		}
		
		//统计每年月品牌用户发布文章数
				public List<Count> load_article(String brand,String year) {
					Connection connection = DBUtil.getConnection();
					String sql ="select COUNT(*) as cout,to_char(UP_TIME,'yyyy-mm') as up_t from article where brand=? and to_char(UP_TIME,'yyyy')=? GROUP BY to_char(UP_TIME,'yyyy-mm')";
					PreparedStatement ps = null;
					ResultSet rs = null;
					List<Count> counts = new ArrayList<Count>();
					try {
						ps = connection.prepareStatement(sql);
						ps.setString(1, brand);
						ps.setString(2, year);
						rs = ps.executeQuery();
						while(rs.next()) {
							Count count = new Count();
							count.setCount(rs.getInt("cout"));
							count.setDate(rs.getString("up_t"));
			            	counts.add(count);
							
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						DBUtil.close(rs);
						DBUtil.close(ps);
						DBUtil.close(connection);
					}
					return counts;
				}
		
	//按用户id查询进行分页
	public Page<GoodLike> load_good(int user_id, int pageIndex, int pageSize) {
        Page<GoodLike> pager = new  Page<GoodLike>();
        Connection connection = DBUtil.getConnection();
        //创建语句传输对象
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        //准备sql语句
        String sql = "select * from user_like_good where user_id=?";
        //数据总条数
        String  sqlCount = "select count(*) from user_like_good where user_id=?";
        //集合中只能放入user对象
        List<GoodLike> goods = new ArrayList<GoodLike>();
        GoodLike good = null;
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
            sql ="select * from (select rownum no,id,user_id,good_id from user_like_good where user_id=? and rownum<?) where no>=?" ;

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, user_id);
            preparedStatement.setInt(2, start+pageSize);
            preparedStatement.setInt(3, start);
            rs = preparedStatement.executeQuery();
            
            //System.out.println(sql+"模糊查询");
            while(rs.next()) {
                good = new GoodLike();
                good.setId(rs.getInt("id"));
				good.setUser_id(rs.getInt("user_id"));
				good.setGood_id(rs.getInt("good_id"));      
                goods.add(good);
            }    
            //往分页对象里面设置数据
            pager.setDatas(goods);
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
			public void delete(int user_id,int good_id) {
				Connection connection = DBUtil.getConnection();
				PreparedStatement preparedStatement = null;
				String sql = "delete from user_like_good where user_id=? and good_id=?";
				System.out.print(sql);
				try {
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setInt(1, user_id);
					preparedStatement.setInt(2, good_id);
					preparedStatement.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					DBUtil.close(preparedStatement);
					DBUtil.close(connection);
				}
			}
			
			//协同过滤失败之后，按照商品的类别和排行榜进行推荐
			public List<Good> loadRecomment2(int user_id) {
				Connection connection = DBUtil.getConnection();
				String sql = "SELECT type from goodd where id in (SELECT good_id from (SELECT * FROM user_like_good WHERE user_id=? order by focus_time desc ) where rownum < 3)";
				PreparedStatement ps = null;
				ResultSet rs = null;
				List<Good> goods = new ArrayList<Good>();
				try {
					ps = connection.prepareStatement(sql);
					ps.setInt(1, user_id);
					rs = ps.executeQuery();
					while(rs.next()) {
						String type=rs.getString("type");
						
						String sql1 = "SELECT * from (SELECT * from goodd where type=? and comment_number>1000 order by good_rate desc ) where ROWNUM<=16";
						ps = connection.prepareStatement(sql1);
				        ps.setString(1, type);
				        rs = ps.executeQuery();
			            
			            
			            while(rs.next()) {
			            	Good good = new Good();
							good.setId(rs.getInt("id"));
							good.setName(rs.getString("name"));
							good.setShop(rs.getString("shop"));
							good.setPrice(rs.getFloat("price"));
							good.setComment_number(rs.getInt("comment_number"));
							good.setGood_rate(rs.getFloat("good_rate"));
							good.setLink(rs.getString("link"));
							good.setBrand(rs.getString("brand"));
							good.setImage(rs.getString("image"));
							System.out.print(good.getComment_number());
			            	goods.add(good);			   
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
				return goods;
			}
}
