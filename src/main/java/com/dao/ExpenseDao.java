package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.entity.ExpenseEntity;

@Repository
public class ExpenseDao 
{
	@Autowired
	JdbcTemplate stmt;
	
	public void addExpense(ExpenseEntity expense)
	{
		stmt.update("insert into expenses (title,vendor,category,amount,paymentmode,expensedate,userid) values (?,?,?,?,?,?,?)", expense.getTitle()
				,expense.getVendor(),expense.getCategory(),expense.getAmount(),expense.getPaymentmode(),expense.getExpensedate(),expense.getUserid());
	}

	public List<ExpenseEntity> getByUserid(Integer userid) 
	{
		List<ExpenseEntity> expenses = stmt.query("select * from expenses where userid = ?",
				new BeanPropertyRowMapper<>(ExpenseEntity.class), userid);
		return expenses;
	}
	
}
