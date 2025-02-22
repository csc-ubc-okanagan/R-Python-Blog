filename <- '_src/2024-10-07-transforming-data.Rmd'
file.exists(filename) # sanity check

#' knit `Rmd` to `HTML` and keep `md`
knitr::knit(filename) #' non-`NULL` `output` fails due to write access
file.exists(gsub('Rmd', 'md', gsub('_src/', '', filename))) # sanity check

#' move `md` file to `_posts`
filename <- gsub('Rmd', 'md', filename)
file.rename(from = gsub('_src/', '', filename),
            to = gsub('_src/', '_posts/', filename))
filename <- gsub('_src', '_posts', filename)
file.exists(filename) # sanity check

#' move figures `figures/post-specific-subfolder`
figures <- list.files('figure')
all(file.exists(paste0('figure/', figures))) # sanity check

folder <- gsub('_posts/', '', filename) %>%
  gsub('\\.md', '', .) %>%
  paste0('figures/', .)

if(dir.exists(folder)) {
  stop('Figures folder already exists!')
} else {
  dir.create(folder)
}

file.rename(paste0('figures/', figures),
            paste0(folder, '/', figures))

#' change dirs in `md` file to `'../figures/post-specific-subfolder/image.png'`
readLines(con = filename) %>%
  gsub('src="figures/', paste0('src="', folder, '/'), .) %>%
  # # change figure referencing
  # gsub('<div class="figure">', '', .) %>%
  # gsub('<img src="', '![](', .) %>%
  # gsub(' alt="plot of chunk unnamed-chunk-4" width="\linewidth" />', '', .) %>%
  # gsub('<p class="caption">plot of chunk unnamed-chunk-4</p>', '', .) %>%
  # gsub('</div>', '', .) %>%
  writeLines(con = filename)
