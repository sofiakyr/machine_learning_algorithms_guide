warning_handler <- function(w) {
  if(w$message == "no non-missing arguments to max; returning -Inf") {
    message("Skipping; no R code found.")
  } else {
    warning(w)
  }
}

inc <- function(o) {
  eval.parent(substitute(o <- o + 1 ))
}
inc_by_n <- function(x, n) {
  eval.parent(substitute(x <- x + n ))
}

files <- list.files(pattern = "\\.R(md)?$", full.names = TRUE)

lint_file_count <- 0
lint_error_count <- 0
lint_error_file_count <- 0

for(file in files) {
  cat("Linting: ", file, "\n")
  tryCatch({
    out <- lintr::lint(file)
    inc(lint_file_count)
    if (length(out) != 0) {
      inc(lint_error_file_count)
      inc_by_n(lint_error_count, length(out))
      print(out)
    } else {
      message("Passed.")
    }
  },
  warning = warning_handler)
}

message("Matched ", length(files), " files.")
message("Linted ", lint_file_count, " files.")

if (lint_error_count != 0) {
  message("Found ", lint_error_count,
          " errors from ", lint_error_count, " files.")
  quit(status = 1)
}
