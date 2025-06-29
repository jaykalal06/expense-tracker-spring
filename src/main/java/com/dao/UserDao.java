package com.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.entity.UserEntity;

@Repository
public class UserDao 
{
	@Autowired
	JdbcTemplate stmt;


		public void addUser(UserEntity userEntity) 
		{
	        stmt.update("insert into users (firstName, lastName, email, password, gender, role, createdAt, profilepicpath) values (?,?,?,?,?,?,?,?)",
	                userEntity.getFirstname(), userEntity.getLastname(), userEntity.getEmail(), 
	                userEntity.getPassword(), userEntity.getGender(), userEntity.getRole(), userEntity.getCreatedat(),userEntity.getProfilePicPath());
	    }
		
		public UserEntity getByEmail(String email) 
		{
			UserEntity user = null;
			try 
			{
				user = stmt.queryForObject("select * from users where email = ? ",
						new BeanPropertyRowMapper<>(UserEntity.class), email);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return user;
		}
		
	

	}