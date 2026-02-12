# Load required packages
library(tidyverse)
library(UpSetR)

# Read the data
drug_data <- read.csv("mydat.csv")

# View the data structure
cat("Data structure:\n")
print(head(drug_data, 10))
cat("\n")
cat("Total rows:", nrow(drug_data), "\n")
cat("Unique individuals:", n_distinct(drug_data$id), "\n")
cat("Unique drug classes:", n_distinct(drug_data$rxclass), "\n\n")

# Remove duplicate entries (same person, same drug class)
drug_data_unique <- drug_data %>%
  select(id, rxclass) %>%
  distinct()

cat("Rows after removing duplicates:", nrow(drug_data_unique), "\n\n")

# Create a binary matrix where each row is an individual 
# and each column is a drug class
# Value is 1 if the person takes that drug class, 0 otherwise
upset_matrix <- drug_data_unique %>%
  mutate(value = 1) %>%
  pivot_wider(
    id_cols = id,
    names_from = rxclass,
    values_from = value,
    values_fill = 0
  )

cat("Binary matrix:\n")
print(upset_matrix)
cat("\n")

# Print summary of combinations
cat("=== Drug Combinations ===\n")
for (i in 1:nrow(upset_matrix)) {
  person_id <- upset_matrix$id[i]
  drugs <- names(upset_matrix)[-1][upset_matrix[i, -1] == 1]
  cat("Individual", person_id, "takes:", paste(drugs, collapse = ", "), "\n")
}
cat("\n")

# Create the UpSet plot
png("upset_plot_r.png", width = 1400, height = 900, res = 120)

upset(
  as.data.frame(upset_matrix[, -1]),  # Exclude the id column
  sets = colnames(upset_matrix)[-1],   # All drug classes
  keep.order = FALSE,
  order.by = "freq",                   # Order by frequency
  decreasing = TRUE,
  mainbar.y.label = "Number of Individuals",
  sets.x.label = "Total Individuals per Drug Class",
  text.scale = c(1.5, 1.3, 1.2, 1.1, 1.5, 1.2),  # Adjust text sizes
  point.size = 4,
  line.size = 1.5,
  set_size.show = TRUE,
  set_size.scale_max = max(colSums(upset_matrix[, -1])) + 1
)

dev.off()

cat("✓ UpSet plot saved to upset_plot_r.png\n")

