# AI Developer: Fine-Tuning BERT for Sentiment Analysis

---

## Objective

This project aims to **fine-tune a pre-trained BERT model (bert-base-uncased)** on a domain-specific product review dataset. The goal is to classify sentiment into **positive, negative, or neutral categories**.

---

## Implementation Summary

### Dataset

* A **custom dataset of product reviews** was utilized, specifically from the electronics domain.

### Preprocessing

* Key preprocessing steps included:
    * **Tokenization** of text data.
    * **Label encoding** for sentiment categories.
    * **Splitting** the dataset into training and validation sets.

### Model

* The project involved **fine-tuning a BERT model** using the **Hugging Face Transformers library** within a Google Colab environment.

### Optimization

* **Hyperparameters were tuned** for optimal performance, including:
    * Learning rate
    * Batch size
    * Number of epochs

---

## Evaluation

* The model's performance was evaluated using the following metrics:
    * **Accuracy**
    * **Precision**
    * **Recall**
    * **F1-Score**
* Common challenges such as **overfitting and class imbalance** were addressed during the process.
* *(Optional)* DistilBERT was also tested to assess the **performance vs. efficiency tradeoff**.

---

## Author

**Athulya B Vijay**
