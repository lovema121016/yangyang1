package com.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Good;
import com.model.User;
import com.util.DBUtil;
import com.util.UserException;

import sun.net.www.content.text.plain;

public class UserDaoImpl implements IUserDao {

	@Override
	public void add(User user) {
		//获得链接对象
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select count(*) from users where username = ?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getUsername());
			//接收结果集
			resultSet = preparedStatement.executeQuery();
			//遍历结果集
			while(resultSet.next()) {
				if (resultSet.getInt(1) > 0) {
					throw new UserException("用户已存在") ;
				}
			}
			
			sql = "INSERT INTO users(username,password,nickname,status) VALUES (?,?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getNickname());
			preparedStatement.setString(4, user.getStatus());
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

	@Override
	public User load(int id) {
		// TODO Auto-generated method stub
		Connection con = DBUtil.getConnection();
        String sql = "SELECT * FROM users WHERE id = ?";
        PreparedStatement ps = null;
        User user = null;
        ResultSet rs = null;
        try {
            user = new User();
            ps = con.prepareStatement(sql);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next()){
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setNickname(rs.getString("nickname"));
                user.setImage(rs.getString("image"));
                user.setStatus(rs.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return  user;
	}

	public List<User> loadUser(String username){

        Connection con = DBUtil.getConnection();
        String sql = "SELECT * FROM users WHERE username = ?";
        PreparedStatement ps = null;
        List<User> users = new ArrayList<User>();
        ResultSet rs = null;
        try {
            User user = new User();
            ps = con.prepareStatement(sql);
            ps.setString(1,username);
            rs = ps.executeQuery();
            while (rs.next()){
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setNickname(rs.getString("nickname"));
                user.setImage(rs.getString("image"));
                user.setStatus(rs.getString("status"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

	@Override
	public User load(String username, String password) {
		// TODO Auto-generated method stub
		 Connection con = DBUtil.getConnection();
	        String sql = "SELECT * FROM users WHERE username = ? and password = ?";
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        User user = null;
	        try {
	            ps = con.prepareStatement(sql);
	            ps.setString(1,username);
	            ps.setString(2,password);
	            rs = ps.executeQuery();
	            while (rs.next()){      //查询到用户
	                user = new User();
	                user.setId(rs.getInt("id"));
	                user.setUsername(rs.getString("username"));
	                user.setUsername(rs.getString("username"));
	                user.setPassword(rs.getString("password"));
	                user.setImage(rs.getString("image"));
	                user.setNickname(rs.getString("nickname"));
	                user.setStatus(rs.getString("status"));
	                return user;
	            }
	        } catch (SQLException e) {      //出错
	            e.printStackTrace();
	        }
	        //查询失败
	        return user;
	    }
	@Override
	public User load(String username) {
		// TODO Auto-generated method stub
		Connection con = DBUtil.getConnection();
        String sql = "SELECT * FROM users WHERE username = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        User user = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1,username);
            rs = ps.executeQuery();
            while (rs.next()){      //查询到用户
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setImage(rs.getString("image"));
                user.setNickname(rs.getString("nickname"));
                user.setStatus(rs.getString("status"));
                return user;
            }
        } catch (SQLException e) {      //出错
            e.printStackTrace();
        }
        System.out.print("yaoyaoya");
        //查询失败
        return user;
	}
	//查询全部用户
		// TODO Auto-generated method stub
		//推荐最有购买方案
		public List<User> loadAll() {
			Connection connection = DBUtil.getConnection();
			String sql = "SELECT * FROM users";
			PreparedStatement ps = null;
			ResultSet rs = null;
			List<User> users = new ArrayList<User>();
			try {
				ps = connection.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()) {
					User user = new User();
	                user.setId(rs.getInt("id"));
	                user.setUsername(rs.getString("username"));
	                user.setUsername(rs.getString("username"));
	                user.setPassword(rs.getString("password"));
	                user.setImage(rs.getString("image"));
	                user.setNickname(rs.getString("nickname"));
	                user.setStatus(rs.getString("status"));
	            	users.add(user);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.close(rs);
				DBUtil.close(ps);
				DBUtil.close(connection);
			}
			return users;
		
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		Connection connection = DBUtil.getConnection();
		String sql = "UPDATE users SET "
				+ "nickname=?,"
				+ "password=?,"
				+ "image=?"
				+ "WHERE id=? or username=?";
		PreparedStatement ps = null;
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, user.getNickname());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getImage());
			ps.setInt(4, user.getId());
			ps.setString(5, user.getUsername());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(ps);
			DBUtil.close(connection);
		}
	}

	@Override
	public void delete(String username) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean valid(User user) {
		// TODO Auto-generated method stub
		return false;
	}
}
