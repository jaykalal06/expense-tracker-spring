package com.entity;

import java.time.LocalDate;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class LoginEntity 
{
	@NotBlank(message = "Please enter Email")
	@Email(message = "Please enter valid Email")
	String email;
	
	@NotBlank(message = "Please enter Password")
	String password;
}
