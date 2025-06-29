package com.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.dao.ExpenseDao;
import com.dao.UserDao;
import com.entity.ExpenseEntity;
import com.entity.LoginEntity;
import com.entity.UserEntity;

import jakarta.servlet.http.HttpSession;


@Controller
public class SessionController 
{
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	UserDao dao;
	
	@Autowired
	Cloudinary cloudinary;
	
	@Autowired
	ExpenseDao expenseDao;
	@GetMapping("/signup")
	public String Signup()
	{
		return "Signup";
	}
	
	@PostMapping("/saveuser")
	public String saveUser(@Validated UserEntity user, BindingResult result, Model model, @RequestParam MultipartFile profilePic)
	{
		System.out.println("Without encryption: "+user.getPassword());
		
		String encrypt_pass = passwordEncoder.encode(user.getPassword());
		user.setPassword(encrypt_pass);
		System.out.println("After Encryption: "+user.getPassword());
		
		if(result.hasErrors())
		{
			model.addAttribute("result", result);
			model.addAttribute("user", user);
			return "Signup";
		}
		else
		{
			System.out.println(user);
			System.out.println(profilePic.getOriginalFilename());
			System.out.println(profilePic.getSize());// bytes
			try {
				
				Map cloud = cloudinary.uploader().upload(profilePic.getBytes(), ObjectUtils.emptyMap());
				System.out.println(cloud);
				String imagePath = cloud.get("secure_url").toString();
				System.out.println(imagePath);
	
				user.setProfilePicPath(imagePath);
	
			} catch (IOException e) {
				e.printStackTrace();
			
			}
			
			
			dao.addUser(user);
		}
		
		return "Login";
	}
	
	@GetMapping("/login")
	public String signin()
	{
		return "Login";
	}
	
	@PostMapping("/checkuser")
	public String checkUser(@Validated LoginEntity user, BindingResult result, Model model, HttpSession session)
	{
		if(result.hasErrors())
		{
			model.addAttribute("result", result);
			model.addAttribute("user", user);
			
			System.out.println("Errors hai");
			return "Login";
		}
		else
		{
			String email = user.getEmail();
			String password = user.getPassword();
			UserEntity user2 = dao.getByEmail(email);
			System.out.println(email);
			System.out.println(password);
			if(user2!=null)
			{
				if(passwordEncoder.matches(password, user2.getPassword()))
				{
					System.out.println("Password sahi hai");
					session.setAttribute("userEmail", user2.getEmail());
					session.setAttribute("userid",user2.getUserid());
					session.setAttribute("profilepicpath", user2.getProfilePicPath());
					return "Home";
				}
				else
				{
					System.out.println("Password galat hai");
					return "Login";
				}
			}
			else
			{
				System.out.println("Emaill galat hai");
				return "Login";
			}
		}
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
	    session.invalidate();  
	    return "Login";
	}
	
	@GetMapping("/addexpense")
	public String newexpense()
	{
		return "AddExpense";
	}
	
	@PostMapping("/saveexpense")
	public String saveexpense(@Validated ExpenseEntity expense, BindingResult result,Model model, HttpSession session)
	{
		if(result.hasErrors())
		{
			return "AddExpense";
		}
		else
		{
			System.out.println(expense);
			Integer userid = (Integer) session.getAttribute("userid");
			expense.setUserid(userid);
			expenseDao.addExpense(expense);
			return "Home";
		}
	}
	
	@GetMapping("/listexpense")
	public String listExpense(HttpSession session,Model model)
	{
		Integer userid = (Integer) session.getAttribute("userid");
		   if (userid == null) 
		   {
		        return "redirect:/login"; 
		   }
		   List<ExpenseEntity> expenses = expenseDao.getByUserid(userid);
		   model.addAttribute("expenses", expenses);
		   System.out.println(expenses);
		return "ListExpense";
	}

	public String postMethodName(@RequestBody String entity) {
		//TODO: process POST request
		
		return entity;
	}
	
}
