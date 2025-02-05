package services;

import java.util.List;
import entity.RoleEntity;
import repository.RoleRepositoty;

//xử lý logic code cho userController
public class UserServices {
	private RoleRepositoty roleRepository = new RoleRepositoty();

	public List<RoleEntity> getRole() {
		List<RoleEntity> roles = roleRepository.findAll();
		return roles;
	}
}