package com.javaclass;

public class Auth {
	
	  public static String passwordValidation(String userName, String password)
      {
              String error;
              
              if (password.length() < 8)
              {
                      error = "Password should more than or 8 characters in length.";
                      return error;
              }
              if (password.indexOf(userName) > -1)
              {
                      error = "Password Should not be same as user name";
                      return error;
              }
              
              String upperCaseChar = "(.*[A-Z].*)";
              
              if (!password.matches(upperCaseChar ))
              {
                      error = "Password should contain atleast one upper case alphabet";
                      return error;
              }
              String lowerCaseChars = "(.*[a-z].*)";
              
              if (!password.matches(lowerCaseChars ))
              {
                      error = "Password should contain atleast one lower case alphabet";
                      return error;
              }
              String numbers = "(.*[0-9].*)";
              
              if (!password.matches(numbers ))
              {
                      error = "Password should contain atleast one number.";
                      return error;
              }
              String specialChars = "(.*[,~,!,@,#,$,%,^,&,*,(,),-,_,=,+,[,{,],},|,;,:,<,>,/,?].*$)";
              
              if (!password.matches(specialChars ))
              {
                      error = "Password should contain atleast one special character";
                      return error;
              }
      
              else
              {
            	  error = "no error";
            	  return error;
              }
      }
}
