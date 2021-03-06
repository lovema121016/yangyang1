package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Brand;
import com.model.User;
import com.util.DBUtil;
import com.util.UserException;

public class BrandDao {

	public void add(Brand brand) {
		//获得链接对象
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select count(*) from brand where brand = ?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, brand.getBrand());
			//接收结果集
			resultSet = preparedStatement.executeQuery();
			//遍历结果集
			while(resultSet.next()) {
				if (resultSet.getInt(1) > 0) {
					throw new UserException("品牌已存在") ;
				}
			}
			
			sql = "INSERT INTO brand(brand,type,remark) VALUES (?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, brand.getBrand());
			preparedStatement.setString(2, brand.getType());
			preparedStatement.setString(3, brand.getRemark());			
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
    
	//根据品牌名查询
	public Brand load(String bran) {
		// TODO Auto-generated method stub
		Connection con = DBUtil.getConnection();
        String sql = "SELECT * FROM brand WHERE brand = ?";
        PreparedStatement ps = null;
        Brand brand = null;
        ResultSet rs = null;
        try {
            
            ps = con.prepareStatement(sql);
            ps.setString(1,bran);
            rs = ps.executeQuery();
            while (rs.next()){
            	brand = new Brand();
            	brand.setId(rs.getInt("id"));
            	brand.setBrand(rs.getString("brand"));
            	brand.setRemark(rs.getString("remark"));
            	brand.setContent(rs.getString("content"));
            	brand.setLogo(rs.getString("logo"));
            	brand.setType(rs.getString("type"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return  brand;
	}
    
	//根据品牌类别查询
	public List<Brand> loadType(String type){

        Connection con = DBUtil.getConnection();
        String sql = "SELECT * FROM brand WHERE TYPE = ?";
        PreparedStatement ps = null;
        List<Brand> brands = new ArrayList<Brand>();
        ResultSet rs = null;
        try {
            
            ps = con.prepareStatement(sql);
            ps.setString(1,type);
            rs = ps.executeQuery();
            while (rs.next()){
            	Brand brand = new Brand();
            	brand.setId(rs.getInt("id"));
            	brand.setBrand(rs.getString("brand"));
            	
            	brand.setType(rs.getString("type"));
                brands.add(brand);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return brands;
    }
	
	//查询所有
		public List<Brand> loadAll(){

	        Connection con = DBUtil.getConnection();
	        String sql = "SELECT * FROM brand";
	        PreparedStatement ps = null;
	        List<Brand> brands = new ArrayList<Brand>();
	        ResultSet rs = null;
	        try {
	            
	            ps = con.prepareStatement(sql);
	            rs = ps.executeQuery();
	            while (rs.next()){
	            	Brand brand = new Brand();
	            	brand.setId(rs.getInt("id"));
	            	brand.setBrand(rs.getString("brand"));
	            	brand.setType(rs.getString("type"));
	            	brand.setRemark(rs.getString("remark"));
	            	brand.setContent(rs.getString("content"));
	            	brand.setLogo(rs.getString("logo"));
	                brands.add(brand);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return brands;
	    }
	//根据品牌名称删除品牌
	public void delete(String brand) {
		Connection connection = DBUtil.getConnection();
		PreparedStatement preparedStatement = null;
		String sql = "delete from brand where brand=?";
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
}
