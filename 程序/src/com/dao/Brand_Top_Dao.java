package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Article;
import com.model.Brand_Top;
import com.util.DBUtil;

public class Brand_Top_Dao {
	//品牌排行榜
	/*
	 * 根据用户收藏的品牌的商品数和用户发布该品牌的文章数，从高到低排序
	 */
    public List<Brand_Top > load_top() {
		Connection connection = DBUtil.getConnection();
		String sql = "select Brand,COUNT(*) as number1 from USER_LIKE_GOOD GROUP BY BRAND ORDER BY COUNT(*) desc";
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Brand_Top> tops = new ArrayList<Brand_Top>();
		try {
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				Brand_Top top = new Brand_Top();
				top.setBrand(rs.getString("brand"));
				top.setFocus_good_number(rs.getInt("number1"));
				tops.add(top);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(rs);
			DBUtil.close(ps);
			DBUtil.close(connection);
		}
		return tops;
	}
}
