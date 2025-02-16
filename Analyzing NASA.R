# Load necessary libraries
library(tidyverse)
library(tidytext)
library(jsonlite)
library(widyr)
library(igraph)
library(ggraph)
library(topicmodels)

# Step 1: Load the NASA metadata
metadata <- fromJSON("https://data.nasa.gov/data.json")  

# Step 2: Prepare and filter the NASA Data for Mars-related datasets
nasa_title <- tibble(id = metadata$dataset$identifier, title = metadata$dataset$title)
nasa_desc <- tibble(id = metadata$dataset$identifier, desc = metadata$dataset$description)
nasa_keyword <- tibble(id = metadata$dataset$identifier, keyword = metadata$dataset$keyword) %>%
  unnest(keyword)

# Filter for Mars-related datasets
mars_datasets <- nasa_title %>%
  filter(str_detect(title, regex("mars", ignore_case = TRUE))) %>%
  pull(id)

nasa_title <- nasa_title %>% filter(id %in% mars_datasets)
nasa_desc <- nasa_desc %>% filter(id %in% mars_datasets)
nasa_keyword <- nasa_keyword %>% filter(id %in% mars_datasets)

# Tokenize and clean text data
nasa_title <- nasa_title %>%
  unnest_tokens(word, title) %>%
  anti_join(stop_words)

nasa_desc <- nasa_desc %>%
  unnest_tokens(word, desc) %>%
  anti_join(stop_words)

# Step 3: Perform Simple Exploration
title_word_freq <- nasa_title %>% count(word, sort = TRUE)
desc_word_freq <- nasa_desc %>% count(word, sort = TRUE)

print("Top 20 words in Mars-related titles:")
print(head(title_word_freq, 20))

print("Top 20 words in Mars-related descriptions:")
print(head(desc_word_freq, 20))

# Plot top 20 words in Mars-related titles
ggplot(head(title_word_freq, 20), aes(x = reorder(word, n), y = n)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  labs(title = "Top 20 Words in Mars-Related NASA Dataset Titles", x = "Words", y = "Frequency")

# Plot top 20 words in Mars-related descriptions
ggplot(head(desc_word_freq, 20), aes(x = reorder(word, n), y = n)) +
  geom_bar(stat = "identity", fill = "darkorange") +
  coord_flip() +
  labs(title = "Top 20 Words in Mars-Related NASA Dataset Descriptions", x = "Words", y = "Frequency")

# Step 4: Perform Word Co-occurrences and Correlations
title_word_pairs <- nasa_title %>%
  pairwise_count(word, id, sort = TRUE)

title_word_cors <- nasa_title %>%
  group_by(word) %>%
  filter(n() >= 20) %>%
  pairwise_cor(word, id, sort = TRUE)

print("Top 20 word pairs in Mars-related titles:")
print(head(title_word_pairs, 20))

print("Top 20 word correlations in Mars-related titles:")
print(head(title_word_cors, 20))

# Step 5: Calculate tf-idf for the description fields
desc_tf_idf <- nasa_desc %>%
  count(id, word, sort = TRUE) %>%
  bind_tf_idf(word, id, n) %>%
  arrange(desc(tf_idf))

print("Top 20 words by tf-idf in Mars-related descriptions:")
print(head(desc_tf_idf, 20))

# Visualization: Plot top 20 words by tf-idf
ggplot(head(desc_tf_idf, 20), aes(x = reorder(word, tf_idf), y = tf_idf)) +
  geom_bar(stat = "identity", fill = "purple") +
  coord_flip() +
  labs(title = "Top 20 Words by TF-IDF in Mars-Related Descriptions", x = "Words", y = "TF-IDF Score")

# Step 6: Networks of Description and Title Words
title_graph <- title_word_cors %>%
  filter(correlation > 0.2) %>%
  graph_from_data_frame()

# Plot the network of correlated words in Mars-related titles
ggraph(title_graph, layout = "fr") +
  geom_edge_link(aes(edge_alpha = correlation), show.legend = FALSE) +
  geom_node_point(color = "lightblue", size = 5) +
  geom_node_text(aes(label = name), vjust = 1.5, hjust = 1.5, size = 4) +
  ggtitle("Network of Correlated Words in Mars-Related Titles") +
  theme_minimal()

# Step 7: Networks of Keywords
keyword_pairs <- nasa_keyword %>% pairwise_count(keyword, id, sort = TRUE)

keyword_cors <- nasa_keyword %>%
  group_by(keyword) %>%
  filter(n() >= 20) %>%
  pairwise_cor(keyword, id, sort = TRUE)

# Create a network graph of correlated keywords
keyword_graph <- keyword_cors %>%
  filter(correlation > 0.6) %>%
  graph_from_data_frame()

# Plot the network of correlated keywords in Mars-related datasets
ggraph(keyword_graph, layout = "fr") +
  geom_edge_link(aes(edge_alpha = correlation), show.legend = FALSE) +
  geom_node_point(color = "darkgreen", size = 5) +
  geom_node_text(aes(label = name), vjust = 1.5, hjust = 1.5, size = 4) +
  ggtitle("Network of Correlated Keywords in Mars-Related Datasets") +
  theme_minimal()

# Step 8: Perform Topic Modeling
desc_dtm <- nasa_desc %>%
  count(id, word) %>%
  cast_dtm(id, word, n)

# Perform Latent Dirichlet Allocation (LDA) to discover 6 topics in the descriptions
desc_lda <- LDA(desc_dtm, k = 6, control = list(seed = 1234))

# Extract topics and their associated terms (beta values represent word importance in topics)
topics <- tidy(desc_lda, matrix = "beta")

# Get the top 10 terms for each topic
top_terms <- topics %>%
  group_by(topic) %>%
  top_n(10, beta) %>%
  ungroup() %>%
  arrange(topic, -beta)

# Visualization: Plot top 10 terms for each of the 6 topics
top_terms %>%
  mutate(term = reorder_within(term, beta, topic)) %>%
  ggplot(aes(term, beta, fill = factor(topic))) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free") +
  coord_flip() +
  scale_x_reordered() +
  labs(title = "Top Terms for Each Topic in Mars-Related Descriptions", x = "Terms", y = "Beta") +
  theme_minimal()

print("Top terms for each topic in Mars-related descriptions:")
print(top_terms)