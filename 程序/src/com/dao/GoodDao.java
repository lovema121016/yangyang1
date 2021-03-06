package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Article;
import com.model.Good;
import com.model.Page;
import com.util.DBUtil;

public class GoodDao {
	
	//推荐最优购买方案
	public List<Good> load(String name) {
		Connection connection = DBUtil.getConnection();
		String sql = "SELECT * FROM goodd WHERE name like ? order by comment_number*0.75+good_rate*0.25 desc";
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Good> goods = new ArrayList<Good>();
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, "%"+name+"%");
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
				System.out.print(good.getComment_number());
            	goods.add(good);
				
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
	
	//根据id查找商品
    public Good load(int id){

        Connection con = DBUtil.getConnection();
        String sql = "SELECT * FROM goodd WHERE id = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        Good good=null;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next()){
            	good = new Good();
				good.setId(rs.getInt("id"));
				good.setName(rs.getString("name"));
				good.setShop(rs.getString("shop"));
				good.setPrice(rs.getFloat("price"));
				good.setComment_number(rs.getInt("comment_number"));
				good.setGood_rate(rs.getFloat("good_rate"));
				good.setLink(rs.getString("link"));
				good.setBrand(rs.getString("brand"));
				good.setType(rs.getString("type"));
				//System.out.print(good.getComment_number());
				good.setImage(rs.getString("image"));
				good.setContent(rs.getString("reamek"));
				good.setCipin(rs.getString("cipin"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            DBUtil.close(rs);
            DBUtil.close(ps);
            DBUtil.close(con);
        }
        return good;
    }
	//根据品牌查询
	public List<Good> loadBrand(String brand) {
		Connection connection = DBUtil.getConnection();
		String sql = "SELECT * FROM goodd WHERE brand=? and rownum<13";
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Good> goods = new ArrayList<Good>();
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, brand);
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
				System.out.print(good.getComment_number());
				good.setImage(rs.getString("image"));
            	goods.add(good);
				
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
	//统计某品牌的商品总数
		public List<Good> loadCountBrand(String brand) {
			Connection connection = DBUtil.getConnection();
			String sql = "SELECT * FROM goodd WHERE brand=?";
			PreparedStatement ps = null;
			ResultSet rs = null;
			List<Good> goods = new ArrayList<Good>();
			try {
				ps = connection.prepareStatement(sql);
				ps.setString(1, brand);
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
					System.out.print(good.getComment_number());
					good.setImage(rs.getString("image"));
	            	goods.add(good);
					
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
	
	  //查询异常数据
		public List<Good> loadError() {
			Connection connection = DBUtil.getConnection();
			String sql = "SELECT * FROM good WHERE good_rate=0";
			PreparedStatement ps = null;
			ResultSet rs = null;
			List<Good> goods = new ArrayList<Good>();
			try {
				ps = connection.prepareStatement(sql);
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
					System.out.print(good.getComment_number());
	            	goods.add(good);
					
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
	//查询所有
		public List<Good> loadAll() {
			Connection connection = DBUtil.getConnection();
			String sql = "SELECT * FROM goodd";
			PreparedStatement ps = null;
			ResultSet rs = null;
			List<Good> goods = new ArrayList<Good>();
			try {
				ps = connection.prepareStatement(sql);
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
					good.setContent(rs.getString("reamek"));
					good.setImage(rs.getString("image"));
					System.out.print(good.getComment_number());
	            	goods.add(good);
					
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
		//根据商品id删除数据
		public void delete(int id) {
			Connection connection = DBUtil.getConnection();
			PreparedStatement preparedStatement = null;
			String sql = "delete from good where id=?";
			try {
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setInt(1, id);
				preparedStatement.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.close(preparedStatement);
				DBUtil.close(connection);
			}
		}
		        //根据商品品牌删除数据
				public void deleteBrand(String brand) {
					Connection connection = DBUtil.getConnection();
					PreparedStatement preparedStatement = null;
					String sql = "delete from goodd where brand=?";
					try {
						preparedStatement = connection.prepareStatement(sql);
						preparedStatement.setString(1, brand);
						preparedStatement.executeUpdate();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						DBUtil.close(preparedStatement);
						DBUtil.close(connection);
					}
				}
				
				//根据商品品牌删除商品和评论数据
				public void deleteBrandAllData(String brand) {
					Connection connection = DBUtil.getConnection();
					PreparedStatement preparedStatement = null;
					String sql = "delete from good_comment where good_id in (select id from goodd where brand=?)";
					try {
						preparedStatement = connection.prepareStatement(sql);
						preparedStatement.setString(1, brand);
						preparedStatement.executeUpdate();
						
						String sql1 = "delete from goodd where brand=?";
						preparedStatement = connection.prepareStatement(sql1);
						preparedStatement.setString(1, brand);
						preparedStatement.executeUpdate();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						DBUtil.close(preparedStatement);
						DBUtil.close(connection);
					}
				}
				//查询最优国货排序
				public List<Good> loadGood() {
					Connection connection = DBUtil.getConnection();
					String sql = "SELECT * from (SELECT * FROM goodd order by comment_number*0.65+good_rate*comment_number*0.35 desc) where rownum<=6 ";
					PreparedStatement ps = null;
					ResultSet rs = null;
					List<Good> goods = new ArrayList<Good>();
					try {
						ps = connection.prepareStatement(sql);
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
							good.setContent(rs.getString("reamek"));
							good.setImage(rs.getString("image"));
							System.out.print(good.getComment_number());
			            	goods.add(good);
							
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
				
				//查询最优前30
				public List<Good> loadGood_best() {
					Connection connection = DBUtil.getConnection();
					String sql = "SELECT * from (SELECT * FROM goodd order by comment_number*0.15+good_rate*comment_number*0.85 desc) where rownum<=30 ";
					PreparedStatement ps = null;
					ResultSet rs = null;
					List<Good> goods = new ArrayList<Good>();
					try {
						ps = connection.prepareStatement(sql);
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
				
				//查询最热前30
				public List<Good> loadGood_hot() {
					Connection connection = DBUtil.getConnection();
					String sql = "SELECT * from (SELECT * FROM goodd order by comment_number desc) where rownum<=30 ";
					PreparedStatement ps = null;
					ResultSet rs = null;
					List<Good> goods = new ArrayList<Good>();
					try {
						ps = connection.prepareStatement(sql);
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
				//查询最热品牌前15
				public List<Good> loadHotBrand() {
					Connection connection = DBUtil.getConnection();
					String sql = "SELECT BRAND from GOODD GROUP BY BRAND ORDER BY COUNT(BRAND) DESC";
					PreparedStatement ps = null;
					ResultSet rs = null;
					List<Good> goods = new ArrayList<Good>();
					try {
						ps = connection.prepareStatement(sql);
						rs = ps.executeQuery();
						while(rs.next()) {
							Good good = new Good();
							good.setBrand(rs.getString("brand"));
			            	goods.add(good);
							
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
				//商品分页
				public Page<Good> load(String content, int pageIndex, int pageSize) {
			        Page<Good> pager = new  Page<Good>();
			        Connection connection = DBUtil.getConnection();
			        //创建语句传输对象
			        PreparedStatement preparedStatement = null;
			        ResultSet rs = null;
			        //准备sql语句
			        String sql = "select * from goodd ";
			        //数据总条数
			        String  sqlCount = "select count(*) from goodd";
			        //集合中只能放入user对象
			        List<Good> goods = new ArrayList<Good>();
			        Good good = null;
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
			            rs = preparedStatement.executeQuery();
			            
			            //总记录数
			            int totalRecord = 0;
			            
			            while(rs.next()) {
			                totalRecord = rs.getInt(1);
			            }    
			            //总页数
			            int totalPage = totalRecord%pageSize == 0 ? totalRecord/pageSize : totalRecord/pageSize + 1;
			            
			            //加分页
			            sql ="select * from (select rownum no,id,name,shop,price,comment_number,good_rate,link,brand,image from goodd where rownum<? order by comment_number) where no>=?" ;

			            preparedStatement = connection.prepareStatement(sql);
			            preparedStatement.setInt(1, start+pageSize);
			            preparedStatement.setInt(2, start);
			            rs = preparedStatement.executeQuery();
			            
			            //System.out.println(sql+"模糊查询");
			            while(rs.next()) {
			                good = new Good();
			                good.setId(rs.getInt("id"));
							good.setName(rs.getString("name"));
							good.setShop(rs.getString("shop"));
							good.setPrice(rs.getFloat("price"));
							good.setComment_number(rs.getInt("comment_number"));
							good.setGood_rate(rs.getFloat("good_rate"));
							good.setLink(rs.getString("link"));
							good.setBrand(rs.getString("brand"));
							good.setImage(rs.getString("image"));       
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
				
				//按商品名称查询进行分页
				public Page<Good> load_good_name(String good_name, int pageIndex, int pageSize) {
			        Page<Good> pager = new  Page<Good>();
			        Connection connection = DBUtil.getConnection();
			        //创建语句传输对象
			        PreparedStatement preparedStatement = null;
			        ResultSet rs = null;
			        //准备sql语句
			        String sql = "select * from goodd where name like ?";
			        //数据总条数
			        String  sqlCount = "select count(*) from goodd where name like ?";
			        //集合中只能放入user对象
			        List<Good> goods = new ArrayList<Good>();
			        Good good = null;
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
			            preparedStatement.setString(1, "%"+good_name+"%");
			            rs = preparedStatement.executeQuery();
			            
			            //总记录数
			            int totalRecord = 0;
			            
			            while(rs.next()) {
			                totalRecord = rs.getInt(1);
			            }    
			            //总页数
			            int totalPage = totalRecord%pageSize == 0 ? totalRecord/pageSize : totalRecord/pageSize + 1;
			            
			            //加分页
			            sql ="select * from (select rownum no,id,name,shop,price,comment_number,good_rate,link,brand,image from goodd where name like ? and rownum<? order by comment_number) where no>=?" ;

			            preparedStatement = connection.prepareStatement(sql);
			            preparedStatement.setString(1, "%"+good_name+"%");
			            preparedStatement.setInt(2, start+pageSize);
			            preparedStatement.setInt(3, start);
			            rs = preparedStatement.executeQuery();
			            
			            //System.out.println(sql+"模糊查询");
			            while(rs.next()) {
			                good = new Good();
			                good.setId(rs.getInt("id"));
							good.setName(rs.getString("name"));
							good.setShop(rs.getString("shop"));
							good.setPrice(rs.getFloat("price"));
							good.setComment_number(rs.getInt("comment_number"));
							good.setGood_rate(rs.getFloat("good_rate"));
							good.setLink(rs.getString("link"));
							good.setBrand(rs.getString("brand"));
							good.setImage(rs.getString("image"));       
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
				
				//按类别查询进行分页
				public Page<Good> loadType(String type, int pageIndex, int pageSize) {
			        Page<Good> pager = new  Page<Good>();
			        Connection connection = DBUtil.getConnection();
			        //创建语句传输对象
			        PreparedStatement preparedStatement = null;
			        ResultSet rs = null;
			        //准备sql语句
			        String sql = "select * from goodd where type=?";
			        String sql2 = "select id from good_type where samll_type=?";
			        System.out.print(type);
			        //数据总条数
			        String  sqlCount = "select count(*) from goodd where type=?";
			        //集合中只能放入user对象
			        List<Good> goods = new ArrayList<Good>();
			        Good good = null;
			        try {
			        	
			        	preparedStatement = connection.prepareStatement(sql2);
			            preparedStatement.setString(1, type);
			            rs = preparedStatement.executeQuery();
			            
			            //种类所在的id
			            int type_id = 0;
			            
			            while(rs.next()) {
			            	type_id = rs.getInt(1);
			            }    
			            
			            String type_idid=Integer.toString(type_id);
			            
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
			            preparedStatement.setString(1, type_idid);
			            rs = preparedStatement.executeQuery();
			            
			            //总记录数
			            int totalRecord = 0;
			            
			            while(rs.next()) {
			                totalRecord = rs.getInt(1);
			            }  
			            
			            //总页数
			            int totalPage = totalRecord%pageSize == 0 ? totalRecord/pageSize : totalRecord/pageSize + 1;
			            
			            //加分页
			            sql ="select * from (select rownum no,id,name,shop,price,comment_number,good_rate,link,brand,image from goodd where type=? and rownum<? order by comment_number) where no>=?" ;

			            preparedStatement = connection.prepareStatement(sql);
			            preparedStatement.setString(1, type_idid);
			            preparedStatement.setInt(2, start+pageSize);
			            preparedStatement.setInt(3, start);
			            rs = preparedStatement.executeQuery();
			            
			            //System.out.println(sql+"模糊查询");
			            while(rs.next()) {
			                good = new Good();
			                good.setId(rs.getInt("id"));
							good.setName(rs.getString("name"));
							good.setShop(rs.getString("shop"));
							good.setPrice(rs.getFloat("price"));
							good.setComment_number(rs.getInt("comment_number"));
							good.setGood_rate(rs.getFloat("good_rate"));
							good.setLink(rs.getString("link"));
							good.setBrand(rs.getString("brand"));
							good.setImage(rs.getString("image"));       
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
				
				
				//按类别和名称查询进行分页
				public Page<Good> loadType_Name(String type,String name, int pageIndex, int pageSize) {
			        Page<Good> pager = new  Page<Good>();
			        Connection connection = DBUtil.getConnection();
			        //创建语句传输对象
			        PreparedStatement preparedStatement = null;
			        ResultSet rs = null;
			        //准备sql语句
			        String sql = "select * from goodd where type=?";
			        String sql2 = "select id from good_type where samll_type=?";
			        System.out.print(type);
			        System.out.print(name);
			        //数据总条数
			        String  sqlCount = "select count(*) from goodd where type=? and name like ?";
			        //集合中只能放入user对象
			        List<Good> goods = new ArrayList<Good>();
			        Good good = null;
			        try {
			        	
			        	preparedStatement = connection.prepareStatement(sql2);
			            preparedStatement.setString(1, type);
			            rs = preparedStatement.executeQuery();
			            
			            //种类所在的id
			            int type_id = 0;
			            
			            while(rs.next()) {
			            	type_id = rs.getInt(1);
			            }    
			            
			            String type_idid=Integer.toString(type_id);
			            
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
			            preparedStatement.setString(1, type_idid);
			            preparedStatement.setString(2, "%"+name+"%");
			            rs = preparedStatement.executeQuery();
			            
			            //总记录数
			            int totalRecord = 0;
			            
			            while(rs.next()) {
			                totalRecord = rs.getInt(1);
			            }  
			            System.out.print(totalRecord);
			            //总页数
			            int totalPage = totalRecord%pageSize == 0 ? totalRecord/pageSize : totalRecord/pageSize + 1;
			            
			            //加分页
			            sql ="select * from (select rownum no,id,name,shop,price,comment_number,good_rate,link,brand,image from goodd where type=? and name like ? and rownum<? order by comment_number) where no>=?" ;

			            preparedStatement = connection.prepareStatement(sql);
			            preparedStatement.setString(1, type_idid);
			            preparedStatement.setString(2, "%"+name+"%");
			            preparedStatement.setInt(3, start+pageSize);
			            preparedStatement.setInt(4, start);
			            rs = preparedStatement.executeQuery();
			            
			            //System.out.println(sql+"模糊查询");
			            while(rs.next()) {
			                good = new Good();
			                good.setId(rs.getInt("id"));
							good.setName(rs.getString("name"));
							good.setShop(rs.getString("shop"));
							good.setPrice(rs.getFloat("price"));
							good.setComment_number(rs.getInt("comment_number"));
							good.setGood_rate(rs.getFloat("good_rate"));
							good.setLink(rs.getString("link"));
							good.setBrand(rs.getString("brand"));
							good.setImage(rs.getString("image"));       
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
		
}
