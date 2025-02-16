# Comprehensive Analysis of NASA Metadata in R using Tidytext

## Project Overview
### Understanding NASA’s Metadata Collection
NASA maintains an extensive repository of **over 32,000 datasets**, covering various topics, from **Earth Science** to **Aerospace Engineering**. This dataset repository serves as a critical resource for researchers and scientists working on space exploration, planetary studies, and various Earth observation missions. 

For this analysis, I focused on **Mars exploration**—an area of immense scientific and exploratory interest. Using **NASA’s metadata**, I aimed to extract meaningful insights into the research themes, missions, and the depth of data available on Mars-related studies. By leveraging advanced text mining techniques, I was able to identify key **patterns, themes, and interconnections** within the metadata, shedding light on NASA’s research trajectory on the **Red Planet**.

### 🔭 Why Focus on Mars?
Mars has long captivated scientists due to its potential for **human colonization** and its relevance in understanding planetary evolution. My initial curiosity was sparked by **Elon Musk’s vision for interplanetary travel**, which emphasized the feasibility of making Mars a second home for humanity. This project, therefore, was an opportunity to delve into NASA’s **Mars-related datasets** and explore how the agency’s research aligns with such ambitions.

By applying **text mining techniques** like **TF-IDF, word co-occurrence analysis, and topic modeling**, I sought to:
- Identify the **key themes** within Mars-related datasets.
- Understand how terms such as **“Mars”, “Rover”, and “Exploration”** are interlinked across different datasets.
- Discover hidden insights that might be useful for researchers studying Mars.

---

##  Analysis Workflow

### 1️⃣ Data Preparation
- Extracted and pre-processed NASA’s **Mars-related** metadata.
- Removed stopwords and conducted **text cleaning** to refine the dataset for analysis.

### 2️⃣ Exploratory Data Analysis (EDA)
- Performed **word frequency analysis** to identify commonly used terms.
- Visualized **dataset structures** to understand recurring themes.

### 3️⃣ Word Co-occurrences & Correlation Analysis
- Mapped **word relationships** to identify common associations between dataset keywords.
- Computed **TF-IDF scores** to pinpoint the most distinctive terms.

### 4️⃣ Topic Modeling (LDA)
- Applied **Latent Dirichlet Allocation (LDA)** to extract core themes from the metadata.
- Identified **clusters of related terms** across different dataset descriptions.

### 5️⃣ Connecting Topics with Keywords
- Explored **how topics are interlinked** across various datasets.
- Constructed **network graphs** to visualize keyword connections and dataset relationships.

---

## 📊 Key Findings & Visualizations

### **I. Top 20 Words in Mars-Related Dataset Titles**

![Top 20 Words - Titles](https://github.com/user-attachments/assets/7d7bfa7b-59ce-4ba9-bbd4-89145159c41f)

- The most frequent words in dataset titles include **Mars, Data, Mission, RDR, and Version (V1.0)**.
- This suggests a structured approach in naming datasets, where **mission identifiers and dataset versions** are consistently used.

### **II. Top 20 Words in Mars-Related Dataset Descriptions**

![Top 20 Words - Descriptions](https://github.com/user-attachments/assets/d358b164-c6d7-4355-ba74-24bcee453b1e)

- Common terms reinforce themes of **data collection, exploration, and scientific research**.
- The analysis indicates a **strong focus on surface imaging and atmospheric observations**.

### **III. Top 20 Words by TF-IDF in Mars-Related Descriptions**

![Top TF-IDF Words](https://github.com/user-attachments/assets/e3da5ae0-0862-4eaa-bd25-0de38f9a09cd)

- TF-IDF analysis highlights the most **distinctive terms** in Mars research.
- Words like **spectrometry, calibration, and telemetry** showcase NASA’s emphasis on **data accuracy and instrumentation**.

### **IV. Network of Correlated Words in Mars-Related Titles**

![Word Correlation Network](https://github.com/user-attachments/assets/eded746a-b319-4926-a977-67974154e75d)

- This visualization reveals **word clusters and their relationships**.
- Central hubs include terms like **“Mars”, “Mission”, and “Data”**, indicating their strong correlation across multiple datasets.

### **V. Network of Correlated Keywords in Mars-Related Datasets**

![Keyword Network](https://github.com/user-attachments/assets/67cacc49-4e87-40f4-92d1-e3d92d626dff)

- This graph provides a **visual understanding of keyword connections**.
- Interlinked keywords suggest **overlapping research areas**, emphasizing NASA’s **multidisciplinary approach to Mars studies**.

### **VI. Top Terms for Each Topic in Mars-Related Descriptions**

![Topic Modeling - Mars Data](https://github.com/user-attachments/assets/d9d36a96-7a8c-4b8c-aa4a-6b75a75522cd)

- **Topic modeling** categorizes datasets into major research domains.
- **Key topics** include **satellite imagery, geospatial mapping, and atmospheric studies**.

---

## Conclusion
### Key Insights from NASA’s Mars Metadata
- NASA’s Mars datasets are highly **interconnected**, reflecting a strong focus on **satellite imaging and rover-based exploration**.
- **Data processing and refinement** play a significant role, with frequent mentions of terms like **level, calibration, and versioning**.
- Strong **cross-dataset relationships** highlight NASA’s collaborative research approach.

### Unexpected Findings
- The prominence of **data management terms** underscores the **importance of structured data handling** in space exploration.
- **Satellite imagery is extensively used**, supporting both **atmospheric and surface studies**.

### Final Takeaways
This analysis reinforced my understanding of NASA’s **Mars exploration missions** and the critical role of **data collection, processing, and analysis**. It highlighted the extensive **interconnections between different datasets**, reflecting NASA’s collaborative research model.

Moreover, this project showcased the **power of text mining techniques** in deriving valuable insights from large datasets, demonstrating how machine learning and statistical methods can enhance space research.

---

**Future Work:** Expanding the analysis to compare NASA’s Mars datasets with other planetary missions and identifying unique trends across different celestial bodies.



