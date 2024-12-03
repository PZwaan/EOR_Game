# Load the dataset
data4 <- read.csv("/Users/pieterzwaanswijk/Downloads/firmdata-4.csv", sep = ";")

# Define column groups
emp_columns <- c(
  "Company", "Round.and.period", "Number.of.employees",
  "Number.of.type.1.employees", "Number.of.type.2.employees",
  "Number.of.type.1.staff.that.fell.sick", "Number.of.type.2.staff.that.fell.sick",
  "Number.of.type.1.staff.that.departed", "Number.of.type.2.staff.that.departed",
  "Average.productivity.of.type.1", "Average.productivity.of.type.2",
  "Realised.gender.ratio", "Total.cost.wages", "Total.cost.hiring",
  "Total.cost.training", "Indicator.whether.employees.were.fired", "X"
)

ins_columns <- c(
  "Company", "Round.and.period", "Postepska.s.fire.insurance.deductible",
  "Postepska.s.fire.insurance.maximum.amount.covered",
  "Postepska.s.fire.insurance.fraction.damage.covered",
  "Postepska.s.fire.insurance.premium", "Osterhaus..fire.insurance.deductible",
  "Osterhaus..fire.insurance.maximum.amount.covered",
  "Osterhaus..fire.insurance.fraction.damage.covered",
  "Osterhaus..fire.insurance.premium", "de.Jonge.s.fire.insurance.deductible",
  "de.Jonge.s.fire.insurance.maximum.amount.covered",
  "de.Jonge.s.fire.insurance.fraction.damage.covered",
  "de.Jonge.s.fire.insurance.premium", "Postepska.s.natural.disaster.insurance1.deductible",
  "Postepska.s.natural.disaster.insurance1.maximum.amount.covered",
  "Postepska.s.natural.disaster.insurance1.fraction.damage.covered",
  "Postepska.s.natural.disaster.insurance1.premium",
  "Meder.s.natural.disaster.insurance2.deductible",
  "Meder.s.natural.disaster.insurance2.maximum.amount.covered",
  "Meder.s.natural.disaster.insurance2.fraction.damage.covered",
  "Meder.s.natural.disaster.insurance2.premium",
  "Pichler.s.natural.disaster.insurance3.deductible",
  "Pichler.s.natural.disaster.insurance3.maximum.amount.covered",
  "Pichler.s.natural.disaster.insurance3.fraction.damage.covered",
  "Pichler.s.natural.disaster.insurance3.premium", "X"
)

maint_columns <- c(
  "Company", "Round.and.period", "Actual.production", "Number.of.machines",
  "Number.of.type.1.machines", "Number.of.type.2.machines",
  "Number.of.type.3.machines", "Number.of.type.4.machines",
  "Number.of.type.5.machines", "Number.of.machine.breakdowns",
  "Marginal.cost.new.machine.purchase", "Total.cost.new.machine.purchases",
  "Base.maintenance.costs.per.machine", "Marginal.cost.machine.inspection",
  "Marginal.cost.machine.type.2.upgrade", "Marginal.cost.machine.type.3.upgrade",
  "Marginal.cost.machine.type.4.upgrade", "Marginal.cost.machine.type.5.upgrade",
  "Total.remaining.value.machines", "X"
)

strat_columns <- c(
  "Company", "Round.and.period", "Cash.firm", "Assets.firm", "Debt.of.the.firm",
  "Interest.rate.firm", "Total.cost.of.production", "Total.revenue.of.production",
  "Total.CO2.emissions.firm", "Emission.trading.rights.costs", "X"
)

ware_columns <- c(
  "Company", "Round.and.period", "Stock.Groninger.mustard.beer",
  "Stock.nonalcoholic.tap.beer", "Stock.Optiecon.tap", "Stock.resource",
  "X"
)

# Extract data for each group
emp_data <- data[, emp_columns, drop = FALSE]
ins_data <- data[, ins_columns, drop = FALSE]
maint_data <- data[, maint_columns, drop = FALSE]
strat_data <- data[, strat_columns, drop = FALSE]
ware_data <- data[, ware_columns, drop = FALSE]

# Extract remaining columns
used_columns <- unique(c(emp_columns, ins_columns, maint_columns, strat_columns, ware_columns))
remaining_columns <- setdiff(colnames(data), used_columns)
remaining_data <- data[, remaining_columns, drop = FALSE]

# Write data to CSV files
write.csv(emp_data, "emp_data.csv", row.names = FALSE)
write.csv(ins_data, "ins_data.csv", row.names = FALSE)
write.csv(maint_data, "maint_data.csv", row.names = FALSE)
write.csv(strat_data, "strat_data.csv", row.names = FALSE)
write.csv(ware_data, "ware_data.csv", row.names = FALSE)
write.csv(remaining_data, "remaining_data.csv", row.names = FALSE)