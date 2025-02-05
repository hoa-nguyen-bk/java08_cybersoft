package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import config.MysqlConfig;
import entity.RoleEntity;

public class RoleRepositoty {
	// Nguyên tắc đặt tên hàm sao cho dễ hình dung tới câu truy vấn
	// SELECT: find
	// WHERE: by
	// vidu: findByEmail -> SELECT * FROM user WHERE email = 
	// vidu2: SELECT * FROM roles r WHERE r.id = 1 AND r.name = "ABC"
	// -> findByIdAndName()
	// nếu mà ko có điều kiện where --> findAll()
	public List<RoleEntity> findAll (){
		List<RoleEntity> list = new ArrayList<RoleEntity>();
		String query = "SELECT * FROM roles r";
		try {
			Connection connection = MysqlConfig.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			ResultSet resultSet = statement.executeQuery();
			
			while(resultSet.next()) {
				RoleEntity entity = new RoleEntity();
				entity.setId(resultSet.getInt("id"));
				entity.setName(resultSet.getString("name"));
				entity.setDescription(resultSet.getString("description"));
				
				list.add(entity);
			}
		} catch (Exception e) {
			// nhớ là đặt theo quy tắc này
			System.out.println("findAll: "+ e.getLocalizedMessage());
		}
		return list;
	}
}
