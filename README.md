# The Residual: replication code

In econometrics, the *residual* is the part of a gap that measured factors can't explain. That leftover is often where discrimination lives.

Each episode of **The Residual** reruns a published finding on inequality from public data and the authors' own code, then stress-tests it. Each folder below contains an R Markdown notebook that downloads the data itself and reproduces every number used in the episode.

| Episode | Folder | Rendered notebook |
|---|---|---|
| 1. Lakisha, Jamal, and twenty years of callbacks | [episode-01-resume-audits](episode-01-resume-audits) | [view](https://karimsouidi.github.io/the-residual/episode-01-resume-audits/episode01_replication.html) |

## Reproducing an episode
Open the episode's `.Rmd` in RStudio and click Knit, or run from a terminal:

```
Rscript -e 'rmarkdown::render("episode01_replication.Rmd")'
```

Found a mistake? Please open an issue. Corrections will be acknowledged on air.

*Views are my own.*
