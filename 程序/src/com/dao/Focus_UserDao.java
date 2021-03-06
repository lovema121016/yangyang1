package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Article;
import com.model.Brand;
import com.model.Focus_Users;
import com.model.GoodLike;
import com.util.DBUtil;
import com.util.UserException;

public class Focus_UserDao {
	public void add(Focus_Users focus) {
		//获得链接对象
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select count(*) from Focus_Users where user_id = ? and focus_username=?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, focus.getUser_id());
			preparedStatement.setString(2,focus.getFocus_username());
			System.out.print(focus.getFocus_username());
			//接收结果集
			resultSet = preparedStatement.executeQuery();
			//遍历结果集
			while(resultSet.next()) {
				if (resultSet.getInt(1) > 0) {
					throw new UserException("已关注该用户") ;
				}
			}
			
			sql = "INSERT INTO focus_users(user_id,focus_username) VALUES (?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, focus.getUser_id());
			preparedStatement.setString(2,focus.getFocus_username());	
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
	
	//根据用户id和文章作者用户名查询用户是否已关注文章作者
    public Focus_Users load(int user_id,String focus_username){

        Connection con = DBUtil.getConnection();
        String sql = "SELECT * FROM focus_users WHERE user_id = ? and focus_username=?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        Focus_Users focus = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1,user_id);
            ps.setString(2, focus_username);
            rs = ps.executeQuery();
            while (rs.next()){
            	focus = new Focus_Users();
            	focus.setId(rs.getInt("id"));
            	focus.setUser_id(rs.getInt("user_id"));
            	focus.setFocus_username(rs.getString("focus_username"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            DBUtil.close(rs);
            DBUtil.close(ps);
            DBUtil.close(con);
        }
        return focus;
    }
    
    //查询关注用户列表
  	public List<Focus_Users> load_Focus_Users(int user_id){

          Connection con = DBUtil.getConnection();
          String sql = "SELECT * FROM focus_users WHERE user_id=?";
          PreparedStatement ps = null;
          List<Focus_Users> focuss = new ArrayList<Focus_Users>();
          ResultSet rs = null;
          try {
              
              ps = con.prepareStatement(sql);
              ps.setInt(1, user_id);
              rs = ps.executeQuery();
              while (rs.next()){
            	Focus_Users focus = new Focus_Users();
            	focus.setUser_id(rs.getInt("user_id"));
            	focus.setFocus_username(rs.getString("focus_username"));
                focuss.add(focus);
              }
          } catch (SQLException e) {
              e.printStackTrace();
          }
          return focuss;
      }
} 
