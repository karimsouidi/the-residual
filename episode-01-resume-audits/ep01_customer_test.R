# Is the race gap bigger where workers serve customers?
# Data: Kline, Rose & Walters (2022), Harvard Dataverse doi:10.7910/DVN/HLO4XC

library(sandwich)
library(lmtest)

# 1. Load the applications and the industry names
apps <- haven::read_dta("https://dataverse.harvard.edu/api/access/datafile/6307466?format=original")
apps <- as.data.frame(haven::zap_labels(apps))
industries <- read.delim("https://dataverse.harvard.edu/api/access/datafile/6307294",
                         fileEncoding = "UTF-8-BOM")
apps <- merge(apps, industries, by = "sic_combined")

# 2. Mark retail and hospitality as customer-facing (SIC 52-59 and 70)
#    Edit this list to try a different definition.
customer_codes <- c(52, 53, 54, 55, 56, 57, 58, 59, 70)
apps$customer_facing <- apps$sic_combined %in% customer_codes

# 3. Contact rates by race, in each group
rates <- aggregate(cb ~ customer_facing + race, data = apps, FUN = mean)
rates$cb <- round(100 * rates$cb, 1)
print(rates)

# 4. Is the gap bigger in customer-facing companies?
#    The black:customer_facing coefficient answers that. Standard errors clustered by job.
model <- lm(cb ~ black * customer_facing + female + over40 + factor(wave), data = apps)
print(round(coeftest(model, vcov = vcovCL(model, cluster = ~ job_id))[
  c("black", "customer_facingTRUE", "black:customer_facingTRUE"), ], 4))

# 5. Same comparison by US region (South has the largest Black population share)
apps$region <- c("Northeast", "Midwest", "South", "West")[apps$region4]
by_region <- aggregate(cb ~ region + race, data = apps, FUN = mean)
by_region$cb <- round(100 * by_region$cb, 1)
print(reshape(by_region, idvar = "region", timevar = "race", direction = "wide"))
