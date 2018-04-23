package com.javaclass;

public class Util {
	
	public static double costCal(double dist, double planRate, double Weight, String [] preCheck)
	{
		double cost = 0;
		
		cost += (dist*planRate);
		
		return cost;
	}
	

}
