library(ggplot2)
library(tidyverse)

emp_data <- read.csv("~/Downloads/historicemployeedata.csv", sep = ";")
ins_data <- read.csv("~/Downloads/historicinsurancedata.csv", sep = ";")
maint_data <- read.csv("~/Downloads/historicmaintenancedata.csv", sep = ";")
strat_data <- read.csv("~/Downloads/historicstrategicdata.csv", sep = ";")
ware_data <- read.csv("~/Downloads/historicwarehousedata.csv", sep = ";")

# Split the 'Round and period' column to extract the year/period
emp_data_clean <- emp_data %>%
  separate(`Round.and.period`, into = c("Round", "Year"), sep = "~", convert = TRUE)

get_statistic <- function(...){
  statistic <- c(...)
  a <- emp_data_clean %>%
    group_by(Company, Round) %>%
    summarise(
      total_sick_proportion_type1 = sum(Number.of.type.1.staff.that.fell.sick, na.rm = TRUE) / 
        sum(Number.of.type.1.employees, na.rm = TRUE),
      total_sick_proportion_type2 = sum(Number.of.type.2.staff.that.fell.sick, na.rm = TRUE) / 
        sum(Number.of.type.2.employees, na.rm = TRUE),
      emp_share1 = sum(Number.of.type.1.employees, na.rm = TRUE) / sum(Number.of.employees, na.rm = TRUE),
      avg_productivity_type1 = mean(Average.productivity.of.type.1, na.rm = TRUE),
      avg_productivity_type2 = mean(Average.productivity.of.type.2, na.rm = TRUE),
      avg_wages = mean(Total.cost.wages, na.rm = TRUE),
      avg_hiring_costs = mean(Total.cost.hiring, na.rm = TRUE),
      avg_training_costs = mean(Total.cost.training, na.rm = TRUE),
      overall_sick_proportion = sum(Number.of.type.1.staff.that.fell.sick + Number.of.type.2.staff.that.fell.sick, na.rm = TRUE) /
        sum(Number.of.employees, na.rm = TRUE),
      production_per_sick_employee = (sum(Average.productivity.of.type.1, na.rm = TRUE) + 
                                        sum(Average.productivity.of.type.2, na.rm = TRUE)) / 
        sum(Number.of.type.1.staff.that.fell.sick + Number.of.type.2.staff.that.fell.sick, na.rm = TRUE),
      wage_per_employee = sum(Total.cost.wages, na.rm = TRUE) / sum(Number.of.employees, na.rm = TRUE),
      cost_per_sick_employee = sum(Total.cost.wages + Total.cost.hiring + Total.cost.training, na.rm = TRUE) /
        sum(Number.of.type.1.staff.that.fell.sick + Number.of.type.2.staff.that.fell.sick, na.rm = TRUE),
      productivity_share_type1 = sum(Average.productivity.of.type.1 * Number.of.type.1.employees, na.rm = TRUE) / 
        (sum(Average.productivity.of.type.1 * Number.of.type.1.employees, na.rm = TRUE) + 
           sum(Average.productivity.of.type.2 * Number.of.type.2.employees, na.rm = TRUE)),
      productivity_share_type2 = sum(Average.productivity.of.type.2 * Number.of.type.2.employees, na.rm = TRUE) / 
        (sum(Average.productivity.of.type.1 * Number.of.type.1.employees, na.rm = TRUE) + 
           sum(Average.productivity.of.type.2 * Number.of.type.2.employees, na.rm = TRUE)),
      cost_per_type1_employee = sum(Total.cost.wages + Total.cost.hiring + Total.cost.training, na.rm = TRUE) / 
        sum(Number.of.type.1.employees, na.rm = TRUE),
      cost_per_type2_employee = sum(Total.cost.wages + Total.cost.hiring + Total.cost.training, na.rm = TRUE) / 
        sum(Number.of.type.2.employees, na.rm = TRUE)
    )%>%
    arrange(Company, Round)
  
  selected_columns <- c("Company", "Round", statistic)
  return(a %>% select(all_of(selected_columns)) %>% group_by(Company))
}

result <- get_statistic("productivity_share_type1", "cost_per_type1_employee", "avg_productivity_type1")

