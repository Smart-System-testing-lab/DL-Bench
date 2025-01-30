# **LLM Leaderboard and Taxonomy Overview**

Welcome to our comprehensive leaderboard and taxonomy breakdown for various Large Language Models (LLMs) when tackling Machine Learning (ML) and Deep Learning (DL) code generation tasks. This document synthesizes the performance of four prominent models—**GPT-4o**, **Claude 3.5 sonet**, **LLama 3.1 (70B)**, and **Mistral 7B**—across multiple dimensions such as input data types, ML stages, and task-specific challenges. We also delve into a detailed taxonomy of common pitfalls and bugs encountered in the generated DL code.

<br/>


## **1. Dataset Statistics**

Below is a consolidated snapshot of the **DLEval** benchmark structure. This table shows how the dataset is split across (1) stages in the ML/DL pipeline, (2) input data types, and (3) common DL/ML tasks. Each count reflects the number of samples or scenarios evaluated in that particular category.

| **Stage in Pipeline** | **Pre-Post Processing** | **Model Construction** | **Training** | **Inference** | **Evaluation** |
| :-------------------- | :---------------------: | :--------------------: | :----------: | :-----------: | :------------: |
| **Count**            | 210                     | 119                    | 75           | 58            | 58             |

| **Data Types**        | **Image** | **Text** | **Structured Array** | **Others** |
| :-------------------- | :-------: | :------: | :------------------: | :--------: |
| **Count**            | 238       | 28       | 84                  | 168        |

| **Task Type**         | **Classification** | **Regression** | **Detection** | **Segmentation** | **Recommendation** | **Prediction** | **General Tasks** |
| :-------------------- | :---------------: | :------------: | :-----------: | :--------------: | :----------------: | :------------: | :---------------: |
| **Count**            | 60                | 14             | 37            | 40               | 17                 | 24             | 328              |

> **Table 1.** **Statistics of DLEval** across ML pipeline stages, data types, and DL/ML task categories.

**Key Takeaways**  
- **Pre-/Post-processing** tasks dominate the pipeline category (210 items).  
- **Image**-based tasks (238) remain the most prevalent data type, followed by **Others** (168).  
- **General Tasks** are notably large (328), suggesting many open-ended or multi-step ML requests that don’t neatly fall under single-task categories like classification or regression.

<br/>

## **2. Overall Snapshot of LLM Performance**

Below is a quick snapshot of the total number of correct outputs (or relevant metric) each model produced for the entire benchmark, offering a high-level view before we drill down into detailed categories.

| **Model**            | **Number of Correct Outputs** |
|:---------------------|:------------------------------:|
| GPT-4o               | 31                            |
| Claude 3.5 sonet     | 28                            |
| LLama 3.1 (70B)      | 21                            |
| Mistral 7B           | 15                            |

> **Table 2.** High-level correctness count (placeholder metric) for each LLM.

<br/>

## **3. Pass@1 Scores by ML Development Stage**

In real-world ML projects, tasks span various stages: Pre-/Post-processing, Model Construction, Training, Inference, and Evaluation. We measured **Pass@1** scores (in %) across these stages to see how each LLM fares at different parts of the pipeline.

| **Model**           | **Pre/Post Processing** | **Model Construction** | **Training** | **Inference** | **Evaluation & Metrics** |
|:--------------------|-------------------------:|-----------------------:|-------------:|--------------:|-------------------------:|
| **GPT-4o**          | 33                      | 26                    | 31           | 30            | 32                       |
| **Claude 3.5 sonet**| 31                      | 22                    | 28           | 30            | 29                       |
| **LLama 3.1 (70B)** | 22                      | 14                    | 21           | 29            | 24                       |
| **Mistral 7B**      | 14                      | 11                    | 16           | 26            | 19                       |

> **Table 3.** **Pass@1 scores (\%)** for different LLMs across ML stages.  

**Observations:**  
- **GPT-4o** leads in most categories, particularly Pre-/Post-processing (33%) and Evaluation & Metrics (32%).  
- **Claude 3.5 sonet** remains competitive, especially for Inference (30%).  
- **LLama 3.1 (70B)** shows noticeable strength at Inference (29%), hinting that it handles forward-pass logic relatively well.  
- **Mistral 7B** lags behind but still reaches 26% at Inference, suggesting partial competency in final deployment tasks.

<br/>

## **4. Pass@1 Scores by Input Data Type**

Since ML tasks can be heavily influenced by the type of data they consume, we also tracked the Pass@1 scores across **Image**, **Text**, **Structured Array**, and **Others** (including custom or unconventional data formats).

| **Model**           | **Image** | **Text** | **Structured Array** | **Others** |
|:--------------------|----------:|---------:|---------------------:|-----------:|
| **GPT-4o**          | 25        | 32       | 29                  | 40         |
| **Claude 3.5 sonet**| 25        | 30       | 24                  | 33         |
| **LLama 3.1 (70B)** | 18        | 30       | 19                  | 26         |
| **Mistral 7B**      | 8         | 23       | 13                  | 25         |

> **Table 4.** **Pass@1 scores (\%)** across various input data types.

**Observations:**  
- **GPT-4o** excels with “Others” data types (40%), possibly due to its flexibility and wide training exposure.  
- Image tasks remain tricky for simpler models, with **Mistral 7B** lagging behind (8%).  
- Text-based inputs yield the most balanced results for all models, highlighting the strengths of LLMs in natural language tasks.

<br/>

## **5. Pass@1 Scores by ML/DL Task**

Deep Learning tasks can be very diverse. We evaluated classification, regression, computer vision tasks (object detection, image segmentation), time series forecasting, recommendation systems, and general tasks.

| **Model**           | **Classification** | **Regression** | **Object Detection** | **Image Segmentation** | **Time Series**<br/>**Prediction** | **Recommendation** | **General** |
|:--------------------|--------------------:|---------------:|---------------------:|-----------------------:|------------------------------------:|--------------------:|------------:|
| **GPT-4o**          | 30                 | 36            | 28                  | 19                    | 33                                  | 58                | 31         |
| **Claude 3.5 sonet**| 32                 | 35            | 30                  | 21                    | 29                                  | 47                | 27         |
| **LLama 3.1 (70B)** | 28                 | 22            | 17                  | 14                    | 31                                  | 40                | 19         |
| **Mistral 7B**      | 24                 | 21            | 11                  | 11                    | 13                                  | 29                | 13         |

> **Table 5.** **Pass@1 scores (\%)** for different ML/DL tasks.

**Highlights:**  
- **GPT-4o** shows strong performance in **Recommendation** systems (58%) and does well on Regression (36%).  
- **Claude 3.5 sonet** edges ahead in **Classification** (32%) and also excels in **Object Detection** (30%).  
- **LLama 3.1 (70B)** remains competitive in **Time Series Prediction** (31%).  
- **Mistral 7B** is more challenged overall, though it still provides moderate coverage across tasks.

<br/>

## **6. Taxonomy of Common Bugs in LLM-Generated DL Code**

Beyond raw accuracy metrics, understanding *how* models go wrong is crucial. Below is a detailed taxonomy of frequently observed bug categories in generated code, specifically for deep learning scenarios. Each category highlights whether the issue is DL-specific or general programming related, along with how many times it occurred.

### **6.1 Generated Code Deviates from Prompt Intention**
These are errors where the model’s solution does not match the user’s requested goal.

| **Subcategory**                            | **DL-Specific?**                   | **Occurrences** |
|:-------------------------------------------|:------------------------------------|----------------:|
| Incorrect DL library or framework usage    | Yes (DL usage)                     | 10             |
| Shape and dimension mismatch              | Yes (DL usage)                     | 45             |
| Incorrect DL/ML Functionality             | Yes (DL usage)                     | 13             |
| Not DL-related                            | No                                  | 52             |
| **Total**                                  |                                      | **120**        |

---

### **6.2 Missing Syntax (Parenthesis, Semicolon, etc.)**
| **Subcategory**                            | **DL-Specific?** | **Occurrences** |
|:-------------------------------------------|:----------------:|----------------:|
| All syntax issues combined                | No               | 0               |

---

### **6.3 Redundant Conditions / Unnecessary Casting**
| **Subcategory**        | **DL-Specific?** | **Occurrences** |
|:-----------------------|:----------------:|----------------:|
| Not DL-related         | No               | 8               |
| **Total**              |                  | **8**           |

---

### **6.4 Code Overly Relies on Prompt Examples**
| **Subcategory**        | **DL-Specific?** | **Occurrences** |
|:-----------------------|:----------------:|----------------:|
| Not DL-related         | No               | 4               |
| **Total**              |                  | **4**           |

---

### **6.5 Fails to Handle Edge Cases**
| **Subcategory**             | **DL-Specific?**    | **Occurrences** |
|:----------------------------|:--------------------:|----------------:|
| Tensor Type and Value Edges| Yes                 | 8               |
| Shape and Dimension Edges  | Yes                 | 15              |
| Not DL-related             | No                  | 10              |
| **Total**                   |                     | **33**          |

---

### **6.6 Incorrect Input Type in Function Calls**
| **Subcategory**                                                     | **DL-Specific?**  | **Occurrences** |
|:--------------------------------------------------------------------|:-----------------:|----------------:|
| Tensor shape mismatch                                               | Yes              | 3               |
| Incorrect ML/DL function library arguments                          | Yes              | 16              |
| Type mismatch problem                                               | Yes              | 23              |
| Not DL-related                                                      | No               | 22              |
| **Total**                                                           |                  | **64**          |

---

### **6.7 Uses Nonexistent or Undefined Objects**
| **Subcategory**           | **DL-Specific?** | **Occurrences** |
|:--------------------------|:----------------:|----------------:|
| Missing or Undefined DL Modules     | Yes            | 9               |
| Incorrect Usage of DL Modules       | Yes            | 12              |
| Not DL-related                      | No             | 11              |
| **Total**                           |                | **32**          |

---

### **6.8 Incorrect/Nonexistent Attributes for Objects or Modules**
| **Subcategory**          | **DL-Specific?** | **Occurrences** |
|:-------------------------|:----------------:|----------------:|
| Wrong DL Module import   | Yes             | 8               |
| Incorrect API Usage      | Yes             | 17              |
| Not DL-related           | No              | 21              |
| **Total**                |                 | **46**          |

---

### **6.9 Adds Non-Requested Features to Code**
| **Subcategory** | **DL-Specific?** | **Occurrences** |
|:---------------|:----------------:|----------------:|
| Not DL-related | No               | 12              |
| **Total**      |                  | **12**          |

---

### **6.10 Errors in Arithmetic or Logical Operations**
| **Subcategory**                                           | **DL-Specific?** | **Occurrences** |
|:----------------------------------------------------------|:----------------:|----------------:|
| Data Type Casting Issues                                  | Yes             | 5               |
| Shape and Dimension Errors in Operations                  | Yes             | 28              |
| Incorrect Algebraic Calculations                          | Yes             | 18              |
| Not DL-related                                            | No              | 21              |
| **Total**                                                 |                 | **72**          |

---

### **6.11 Incorrect or Undefined Variable/Method References**
| **Subcategory** | **DL-Specific?** | **Occurrences** |
|:---------------|:----------------:|----------------:|
| Not DL-related | No               | 11              |
| **Total**      |                  | **11**          |

---

### **6.12 Incorrect Constant Value Assignment**
| **Subcategory**                | **DL-Specific?** | **Occurrences** |
|:-------------------------------|:----------------:|----------------:|
| Incorrect Tensor Constant Value| Yes             | 6               |
| **Total**                      |                  | **6**           |

---

### **6.13 Performance Issues**
| **Subcategory**       | **DL-Specific?** | **Occurrences** |
|:----------------------|:----------------:|----------------:|
| DL performance issue  | Yes             | 2               |
| Not DL-related        | No              | 1               |
| **Total**             |                  | **3**           |

---

### **6.14 Prompt Missing Information**
| **Subcategory**                      | **DL-Specific?** | **Occurrences** |
|:-------------------------------------|:----------------:|----------------:|
| Not defining correct DL library      | Yes             | 4               |
| Not DL-related                       | No              | 6               |
| **Total**                            |                  | **10**          |

<br/>

## **7. Concluding Remarks**

From this extensive exploration, a few key points emerge:

1. **GPT-4o** generally leads in most categories, showing strong multi-stage ML competence and broad coverage across data types.  
2. **Claude 3.5 sonet** performs admirably, often running neck-and-neck with GPT-4o, especially in classification and object detection.  
3. **LLama 3.1 (70B)** has pockets of strength (notably in inference and time series tasks) but lags in certain aspects like model construction.  
4. **Mistral 7B** shows the lowest scores overall, yet exhibits some capability in inference-driven tasks.

Regarding **taxonomy**, the most frequent issues relate to **shape/dimension mismatches**, **incorrect library or API usage**, and **prompt deviations** (where the code doesn’t reflect the user’s original request). A significant chunk of errors also comes from **incorrect or undefined references** and **misaligned argument types** in function calls.

This taxonomy underscores the importance of robust prompt engineering and post-generation verification when relying on LLMs for ML/DL code creation. By identifying and categorizing these pitfalls, practitioners can adopt targeted prompting strategies, or design post-processing checks to mitigate recurring issues.

---

### **Future Directions**
- **Prompt Engineering Refinements:** Minimizing shape/dimension mismatch could be achieved by providing more explicit instructions and constraints in the prompt.  
- **API Standardization:** Encouraging the LLM to adhere to a standard set of libraries and their documented usage.  
- **Model Improvements:** Enhanced training or fine-tuning for specialized tasks (e.g., image segmentation) could bridge performance gaps.  
- **Human-in-the-Loop Systems:** Automatic code scanning tools that flag common pitfalls (e.g., dimension mismatches) before the code is finalized.

Thank you for exploring this leaderboard and taxonomy overview. We hope the insights provided here aid in improving LLM-based solutions for complex ML/DL pipelines!
