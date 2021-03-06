package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Good;
import com.model.Good_Type;
import com.util.DBUtil;

public class Good_type_dao {
	//中类别查询
	public List<String> loadMidlle() {
		Connection connection = DBUtil.getConnection();
		String sql = "select MIDDLE_TYPE from GOOD_TYPE GROUP BY MIDDLE_TYPE";
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<String> middle = new ArrayList<String>();
		try {
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				String mid=rs.getString("MIDDLE_TYPE");
            	middle.add(mid);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(rs);
			DBUtil.close(ps);
			DBUtil.close(connection);
		}
		return middle;
	}
	
	//根据中类名称查询
		public List<Good_Type> load(String middle) {
			Connection connection = DBUtil.getConnection();
			String sql = "SELECT * FROM good_type where middle_type=?";
			PreparedStatement ps = null;
			ResultSet rs = null;
			List<Good_Type> types = new ArrayList<Good_Type>();
			try {
				ps = connection.prepareStatement(sql);
				ps.setString(1, middle);
				rs = ps.executeQuery();
				while(rs.next()) {
					Good_Type type = new Good_Type();
					type.setId(rs.getInt("id"));
					type.setMiddle_type(rs.getString("middle_type"));
					type.setSmall_type(rs.getString("samll_type"));
	            	types.add(type);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.close(rs);
				DBUtil.close(ps);
				DBUtil.close(connection);
			}
			return types;
		}
		
		//根据id查询
		public Good_Type loadID(String id) {
					Connection connection = DBUtil.getConnection();
					String sql = "SELECT * FROM good_type where id=?";
					PreparedStatement ps = null;
					ResultSet rs = null;
					Good_Type type = new Good_Type();
					try {
						ps = connection.prepareStatement(sql);
						ps.setInt(1, Integer.valueOf(id));
						rs = ps.executeQuery();
						while(rs.next()) {
							
							type.setId(rs.getInt("id"));
							type.setMiddle_type(rs.getString("middle_type"));
							type.setSmall_type(rs.getString("samll_type"));
			            
							
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						DBUtil.close(rs);
						DBUtil.close(ps);
						DBUtil.close(connection);
					}
					return type;
				}
		//查询所有
				public List<Good_Type> loadAll() {
					Connection connection = DBUtil.getConnection();
					String sql = "SELECT * FROM good_type";
					PreparedStatement ps = null;
					ResultSet rs = null;
					List<Good_Type> types = new ArrayList<Good_Type>();
					try {
						ps = connection.prepareStatement(sql);
						rs = ps.executeQuery();
						while(rs.next()) {
							Good_Type type = new Good_Type();
							type.setId(rs.getInt("id"));
							type.setMiddle_type(rs.getString("middle_type"));
							type.setSmall_type(rs.getString("samll_type"));
			            	types.add(type);
							
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						DBUtil.close(rs);
						DBUtil.close(ps);
						DBUtil.close(connection);
					}
					return types;
				}
} 
