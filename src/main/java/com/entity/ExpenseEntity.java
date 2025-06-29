package com.entity;

import java.time.LocalDate;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PastOrPresent;
import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ExpenseEntity 
{
	@NotBlank(message = "Please enter the expense title")
    String title;

    @NotBlank(message = "Please enter the vendor name")
    String vendor;

    @NotBlank(message = "Please select a category")
    String category;

    @NotNull(message = "Please enter an amount")
    @Min(value = 1, message = "Amount must be greater than 0")
    Integer amount;

    @NotBlank(message = "Please select a payment mode")
    String paymentmode;

    @NotNull(message = "Please select the expense date")
    @PastOrPresent(message = "Expense date cannot be in the future")
    LocalDate expensedate;
    
    Integer userid;
}
