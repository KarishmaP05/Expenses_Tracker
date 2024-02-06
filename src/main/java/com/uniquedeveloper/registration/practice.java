package com.uniquedeveloper.registration;


import java.time.LocalDate;

import java.util.Arrays;



import java.util.HashMap;
import java.util.Map;

public class practice {
	
	public static void main(String args[]) {
		

		
		        // Example arrays of dates and amounts
		        LocalDate[] dates = {LocalDate.of(2022, 1, 1), LocalDate.of(2022, 1, 2),
		                             LocalDate.of(2022, 1, 1), LocalDate.of(2022, 1, 2)};
		        double[] amounts = {100.0, 200.0, 150.0, 250.0};

		        // Create a map to store aggregated amounts for each unique date
		        Map<LocalDate, Double> aggregatedAmounts = new HashMap<>();

		        // Iterate through the arrays and aggregate amounts
		        for (int i = 0; i < dates.length; i++) {
		            LocalDate currentDate = dates[i];
		            double currentAmount = amounts[i];

		            // Check if the date is already in the map
		            if (aggregatedAmounts.containsKey(currentDate)) {
		                // If the date is present, add the current amount to the existing amount
		                aggregatedAmounts.put(currentDate, aggregatedAmounts.get(currentDate) + currentAmount);
		            } else {
		                // If the date is not present, add a new entry to the map
		                aggregatedAmounts.put(currentDate, currentAmount);
		            }
		        }

		        // Create arrays to store unique dates and their corresponding aggregated amounts
		        LocalDate[] uniqueDates = new LocalDate[aggregatedAmounts.size()];
		        double[] aggregatedAmountsArray = new double[aggregatedAmounts.size()];

		        // Populate the arrays with values from the map
		        int index = 0;
		        for (Map.Entry<LocalDate, Double> entry : aggregatedAmounts.entrySet()) {
		            uniqueDates[index] = entry.getKey();
		            aggregatedAmountsArray[index] = entry.getValue();
		            index++;
		        }

		        // Print the arrays
		        System.out.println("Unique Dates Array: " + Arrays.toString(uniqueDates));
		        System.out.println("Aggregated Amounts Array: " + Arrays.toString(aggregatedAmountsArray));
		    }
		

		
	
	    }

	

	
	


