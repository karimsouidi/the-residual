# Episode 1: Lakisha, Jamal, and twenty years of callbacks

## Papers
- Bertrand, M. & Mullainathan, S. (2004). [Are Emily and Greg More Employable than Lakisha and Jamal?](https://doi.org/10.1257/0002828042002561) *American Economic Review* 94(4). Data: `ResumeNames` in the R package AER.
- Kline, P., Rose, E. & Walters, C. (2022). [Systemic Discrimination Among Large U.S. Employers](https://doi.org/10.1093/qje/qjac024). *Quarterly Journal of Economics* 137(4). Data: [Harvard Dataverse](https://doi.org/10.7910/DVN/HLO4XC) (CC0).
- Kline, P., Rose, E. & Walters, C. (2024). [A Discrimination Report Card](https://www.nber.org/papers/w32313). NBER Working Paper 32313.

## Key results reproduced
| Result | Published | This replication |
|---|---|---|
| Callbacks, White vs Black names (2001–02) | 9.65% vs 6.45% | 9.65% vs 6.45% |
| Contact within 30 days, White vs Black names (2019–21) | 25.1% vs 23.0% | 25.1% vs 23.0% |
| Race gap, LPM with controls | about 2.1 pp | 2.05 pp |
| Firms flagged at q ≤ 0.05 | 23 | 23 |

## Extensions in this notebook
- Résumé-quality analysis (Table 4, Panel B) repeated over 1,000 random splits: White applicants gain more from a better résumé in 98.9% of splits, but the difference is significant in only 55.7%.
- Name-level noise test: within each race-and-gender group, differences between first names are no larger than chance.
- Correction-method comparison: Storey q-values flag 23 firms; Benjamini–Hochberg flags 15.
- Customer-facing test: the race gap is about four times larger in retail and hospitality companies (3.1 vs 0.8 percentage points). See `ep01_customer_test.R`.

## Files
- `episode01_replication.Rmd`: the notebook (downloads all data itself; about one minute to run)
- `episode01_replication.html`: rendered output
- `ep01_customer_test.R`: compares the race gap in customer-facing companies with all others (runs in seconds)
