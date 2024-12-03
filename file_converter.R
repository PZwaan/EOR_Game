# Load the dataset
data <- read.csv("/Users/pieterzwaanswijk/Downloads/firmdata-4.csv", sep = ";")

# Define column groups
emp_columns <- c(
  "Company", "Round.and.period", "Number.of.employees", 
  "Number.of.type.1.employees", "Number.of.type.2.employees", 
  "Number.of.type.1.staff.that.fell.sick", "Number.of.type.2.staff.that.fell.sick", 
  "Number.of.type.1.staff.that.departed", "Number.of.type.2.staff.that.departed", 
  "Average.productivity.of.type.1", "Average.productivity.of.type.2", 
  "Realised.gender.ratio", "Total.cost.wages", "Total.cost.hiring", 
  "Total.cost.training", "Indicator.whether.employees.were.fired", 
  "Desired.gender.ratio", "Increase.in.employee.wages", 
  "Number.of.spare.employees", "Staff.shortage.policy", 
  "Number.of.shifts.per.day", "Ratio.type.1.and.type.2.employees", 
  "Training.type.1.employees", "Training.type.2.employees", 
  "Indicator.whether.employees.can.be.fired", "X"
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
  "de.Jonge.s.fire.insurance.premium", 
  "Postepska.s.natural.disaster.insurance1.deductible", 
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
  "Pichler.s.natural.disaster.insurance3.premium", 
  "Osterhaus..work.floor.accident.insurance1.deductible", 
  "Osterhaus..work.floor.accident.insurance1.maximum.amount.covered", 
  "Osterhaus..work.floor.accident.insurance1.fraction.damage.covered", 
  "Osterhaus..work.floor.accident.insurance1.premium", 
  "de.Jonge.s.work.floor.accident.insurance2.deductible", 
  "de.Jonge.s.work.floor.accident.insurance2.maximum.amount.covered", 
  "de.Jonge.s.work.floor.accident.insurance2.fraction.damage.covered", 
  "de.Jonge.s.work.floor.accident.insurance2.premium", 
  "Meder.s.work.floor.accident.insurance3.deductible", 
  "Meder.s.work.floor.accident.insurance3.maximum.amount.covered", 
  "Meder.s.work.floor.accident.insurance3.fraction.damage.covered", 
  "Meder.s.work.floor.accident.insurance3.premium", 
  "Postepska.s.lawsuit.insurance1.deductible", 
  "Postepska.s.lawsuit.insurance1.maximum.amount.covered", 
  "Postepska.s.lawsuit.insurance1.fraction.damage.covered", 
  "Postepska.s.lawsuit.insurance1.premium", 
  "Osterhaus..lawsuit.insurance2.deductible", 
  "Osterhaus..lawsuit.insurance2.maximum.amount.covered", 
  "Osterhaus..lawsuit.insurance2.fraction.damage.covered", 
  "Osterhaus..lawsuit.insurance2.premium", 
  "Pichler.s.lawsuit.insurance3.deductible", 
  "Pichler.s.lawsuit.insurance3.maximum.amount.covered", 
  "Pichler.s.lawsuit.insurance3.fraction.damage.covered", 
  "Pichler.s.lawsuit.insurance3.premium", "Total.cost.fire.damages", 
  "Total.cost.natural.disasters", "Total.cost.work.floor.accidents", 
  "Total.cost.lawsuits", "Insurance.payout.fire.damages", 
  "Insurance.payout.natural.disaster.damages", 
  "Insurance.payout.work.floor.accident.damages", 
  "Insurance.payout.lawsuit.damages", 
  "Fire.insurance.chosen", "Natural.disaster.insurance.chosen", 
  "Accident.insurance.chosen", "Lawsuit.insurance.chosen", "X"
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
  "Marginal.cost.machine.type.1.repair", "Marginal.cost.machine.type.2.repair", 
  "Marginal.cost.machine.type.3.repair", "Marginal.cost.machine.type.4.repair", 
  "Marginal.cost.machine.type.5.repair", "Resale.value.per.machine.type.1", 
  "Resale.value.per.machine.type.2", "Resale.value.per.machine.type.3", 
  "Resale.value.per.machine.type.4", "Resale.value.per.machine.type.5", 
  "Total.cost.base.maintenance", "Total.cost.inspection", "Total.cost.upgrade", 
  "Total.cost.repair", "Total.remaining.value.machines", 
  "Repair.strategy.type.1.machines", "Repair.strategy.type.2.machines", 
  "Repair.strategy.type.3.machines", "Repair.strategy.type.4.machines", 
  "Repair.strategy.type.5.machines", "Inspection.strategy.type.2.machines", 
  "Inspection.strategy.type.3.machines", "Inspection.strategy.type.4.machines", 
  "Inspection.strategy.type.5.machines", "Inspection.frequency.machines", 
  "Number.of.spare.machines", "X"
)
strat_columns <- c(
  "Company", "Round.and.period", "Cash.firm", "Assets.firm", "Debt.of.the.firm", 
  "Interest.rate.firm", "Total.cost.of.production", "Total.revenue.of.production", 
  "Total.CO2.emissions.firm", "Emission.trading.rights.costs", 
  "CO2.emissions.reduction.expenditures", 
  "Price.nonalcoholic.Groninger.mustard.beer", "Price.nonalcoholic.tap.beer", 
  "Price.Optiecon.tap", "Production.weight.Groninger.mustard.beer", 
  "Production.weight.nonalcoholic.tap.beer", "Production.weight.Optiecon.tap", 
  "Resource.requirement.nonalcoholic.Groninger.mustard.beer", 
  "Resource.requirement.nonalcoholic.tap.beer", 
  "Resource.requirement.Optiecon.tap", "Number.of.competitors.tap.beer", 
  "Output.per.competitor.tap.beer", "Amount.of.land.units.owned", 
  "Amount.of.factory.hall.units.owned", "Price.land.per.unit", 
  "Price.factory.hall.per.unit", "Fixed.cost.buying.land", 
  "Fixed.cost.building.or.expanding.factory.hall", 
  "Marginal.cost.land.maintenance", "Total.cost.land.maintenance", 
  "Marginal.cost.factoryhall.renting", "Total.cost.factoryhall.renting", 
  "Marginal.cost.factory.hall.maintenance", "Total.cost.factory.hall.maintenance", 
  "Total.cost.factory.hall.and.land.area", 
  "Output.nonalcoholic.Groninger.mustard.beer", 
  "Output.nonalcoholic.tap.beer", "Output.Optiecon.tap", 
  "Labor.to.capital.ratio", "Emission.reduction", 
  "Increase.land.area.units", "Increase.factory.area.units", 
  "Location.factory.hall", "Fraction.of.debt.payoff", 
  "Liquidation.order.in.case.of.bankruptcy", "X"
)

ware_columns <- c(
  "Company", "Round.and.period", "Stock.Groninger.mustard.beer", 
  "Stock.nonalcoholic.tap.beer", "Stock.Optiecon.tap", "Stock.resource", 
  "Marginal.cost.storage.Groninger.mustard.beer", 
  "Marginal.cost.storage.nonalcoholic.tap.beer", 
  "Marginal.cost.storage.Optiecon.tap", "Marginal.cost.storage.resource", 
  "Total.cost.storage.Groninger.mustard.beer", 
  "Total.cost.storage.nonalcoholic.tap.beer", 
  "Total.cost.storage.Optiecon.tap", "Total.cost.storage.resources", 
  "Marginal.cost.resource.Stephan.Supplies", "Marginal.cost.resource.Kong.Supplies", 
  "Marginal.cost.resource.Zhu.Supplies", "Carbon.emission.per.resource.Stephan.Supplies", 
  "Carbon.emission.per.resource.Kong.Supplies", 
  "Carbon.emission.per.resource.Zhu.Supplies", 
  "Fixed.cost.of.placing.an.order.of.resources.Stephan.Supplies", 
  "Fixed.cost.of.placing.an.order.of.resources.Kong.Supplies", 
  "Fixed.cost.of.placing.an.order.of.resources.Zhu.Supplies", 
  "Marginal.cost.shortage.Groninger.mustard.beer.unit", 
  "Marginal.cost.shortage.nonalcoholic.tap.beer.unit", 
  "Marginal.cost.shortage.Optiecon.tap.unit", "Total.cost.shorage.resource.unit", 
  "Total.cost.order.resource", "Total.cost.shortfall.Groninger.mustard.beer", 
  "Total.cost.shortfall.nonalcoholic.tap.beer", 
  "Total.cost.shortfall.Optiecon.tap", "Total.cost.shortfall.resource", 
  "Ordered.resources", "Delivered.resources", "Usable.delivered.resources", 
  "Supplier", "Reorder.benchmark.nonalcoholic.Groninger.mustard.beer", 
  "Reorder.benchmark.nonalcoholic.tap.beer", "Reorder.benchmark.Optiecon.tap", 
  "Reorder.benchmark.resource", "Reorder.threshold.resource", "X"
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
write.csv(emp_data, "emp_data4.csv", row.names = FALSE)
write.csv(ins_data, "ins_data4.csv", row.names = FALSE)
write.csv(maint_data, "maint_data4.csv", row.names = FALSE)
write.csv(strat_data, "strat_data4.csv", row.names = FALSE)
write.csv(ware_data, "ware_data4.csv", row.names = FALSE)
write.csv(remaining_data, "remaining_data4.csv", row.names = FALSE)
