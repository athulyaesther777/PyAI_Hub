

# 📦 Install required libraries
!pip install transformers datasets nltk pandas wandb --quiet

# 🧠 Import necessary packages
import pandas as pd
import numpy as np
import nltk
import torch
from datasets import Dataset
from transformers import BertTokenizer, BertForSequenceClassification, Trainer, TrainingArguments
from sklearn.metrics import accuracy_score
import wandb

# 🛠 Download stopwords
nltk.download("stopwords")

# 🛡️ Login to W&B (first time only)
wandb.login()
wandb.init(project="huggingface", name="bert-rating-prediction")

# 📂 Load the CSV (update path if needed)
df = pd.read_csv("/content/flipkart_reviews.csv")  # ✅ change path if needed

# ✅ Rename for consistency
df = df.rename(columns={"Review": "text", "Rating": "label"})

# 🔁 Convert label from 1–5 to 0–4 (needed for classification)
df["label"] = df["label"] - 1

# 🚫 Drop rows with missing values
df.dropna(subset=["text", "label"], inplace=True)

# 🧪 Convert to HuggingFace Dataset and split
dataset = Dataset.from_pandas(df)
dataset = dataset.train_test_split(test_size=0.2)
train_dataset = dataset["train"]
eval_dataset = dataset["test"]

# ✂️ Load tokenizer and model
tokenizer = BertTokenizer.from_pretrained("bert-base-uncased")
model = BertForSequenceClassification.from_pretrained("bert-base-uncased", num_labels=5)

# 🧹 Tokenize the text
def preprocess_function(examples):
    return tokenizer(examples["text"], truncation=True, padding=True)

train_dataset = train_dataset.map(preprocess_function, batched=True)
eval_dataset = eval_dataset.map(preprocess_function, batched=True)

# Convert to PyTorch Tensors
train_dataset.set_format(type="torch", columns=["input_ids", "attention_mask", "label"])
eval_dataset.set_format(type="torch", columns=["input_ids", "attention_mask", "label"])

# ⚙️ Define training arguments
training_args = TrainingArguments(
    output_dir="./results",

    num_train_epochs=3,
    per_device_train_batch_size=8,
    per_device_eval_batch_size=8,
    logging_dir="./logs",
    report_to="wandb",
    run_name="bert-rating-prediction"
)

# 📊 Define accuracy metric
def compute_metrics(pred):
    labels = pred.label_ids
    preds = np.argmax(pred.predictions, axis=1)
    acc = accuracy_score(labels, preds)
    return {"accuracy": acc}

# 🏋️ Define the Trainer
trainer = Trainer(
    model=model,
    args=training_args,
    train_dataset=train_dataset,
    eval_dataset=eval_dataset,
    tokenizer=tokenizer,
    compute_metrics=compute_metrics
)

# 🚀 Train the model
trainer.train()

trainer.evaluate()

import pandas as pd

df = pd.read_csv('flipkart_reviews.csv')  # Replace with your actual filename
df.head()

from sklearn.model_selection import train_test_split

train_texts, test_texts, train_labels, test_labels = train_test_split(
    df['Review'].astype(str), df['Rating'] - 1, test_size=0.2, random_state=42
)

from transformers import BertTokenizer

tokenizer = BertTokenizer.from_pretrained('bert-base-uncased')

test_encodings = tokenizer(
    test_texts.tolist(),
    truncation=True,
    padding=True,
    max_length=512
)

import torch
from torch.utils.data import Dataset

class ReviewDataset(Dataset):
    def __init__(self, encodings, labels):
        self.encodings = encodings
        self.labels = labels

    def __len__(self):
        return len(self.labels)

    def __getitem__(self, idx):
        item = {key: torch.tensor(val[idx]) for key, val in self.encodings.items()}
        item['labels'] = torch.tensor(self.labels.iloc[idx])
        return item

test_dataset = ReviewDataset(test_encodings, test_labels)

predictions = trainer.predict(test_dataset)
predicted_ratings = np.argmax(predictions.predictions, axis=1) + 1  # Add 1 to bring back to 1–5
print(predicted_ratings)

import pandas as pd
import numpy as np
import torch
from sklearn.model_selection import train_test_split
from transformers import BertTokenizer, BertForSequenceClassification, Trainer, TrainingArguments
from torch.utils.data import Dataset

# ✅ 1. Load your data
df = pd.read_csv("flipkart_reviews.csv")  # 👈 replace with your actual filename
df = df[['Review', 'Rating']].dropna()  # Optional: remove rows with missing data

# ✅ 2. Prepare text and labels
df['Rating'] = df['Rating'].astype(int)
train_texts, test_texts, train_labels, test_labels = train_test_split(
    df['Review'].astype(str), df['Rating'] - 1, test_size=0.2, random_state=42
)

# ✅ 3. Tokenization
tokenizer = BertTokenizer.from_pretrained("bert-base-uncased")

train_encodings = tokenizer(train_texts.tolist(), truncation=True, padding=True, max_length=512)
test_encodings = tokenizer(test_texts.tolist(), truncation=True, padding=True, max_length=512)

# ✅ 4. Dataset class
class ReviewDataset(Dataset):
    def __init__(self, encodings, labels):
        self.encodings = encodings
        self.labels = labels.reset_index(drop=True)

    def __len__(self):
        return len(self.labels)

    def __getitem__(self, idx):
        item = {k: torch.tensor(v[idx]) for k, v in self.encodings.items()}
        item["labels"] = torch.tensor(self.labels[idx])
        return item

train_dataset = ReviewDataset(train_encodings, train_labels)
test_dataset = ReviewDataset(test_encodings, test_labels)

# ✅ 5. Load model
model = BertForSequenceClassification.from_pretrained("bert-base-uncased", num_labels=5)

# ✅ 6. Training arguments
training_args = TrainingArguments(
    output_dir="./results",
    num_train_epochs=3,
    per_device_train_batch_size=8,
    logging_dir="./logs",
    logging_steps=50,
    report_to="wandb",
    run_name="bert-rating-prediction"
)

# ✅ 7. Trainer
trainer = Trainer(
    model=model,
    args=training_args,
    train_dataset=train_dataset,
    tokenizer=tokenizer,
)

# ✅ 8. Train the model (skip if already done)
trainer.train()

# ✅ 9. Predict on test data
predictions = trainer.predict(test_dataset)
predicted_ratings = np.argmax(predictions.predictions, axis=1) + 1  # back to 1–5

# ✅ 10. Display predictions
for i in range(10):
    print(f"Review: {test_texts.iloc[i]}")
    print(f"Actual Rating: {test_labels.iloc[i] + 1}, Predicted Rating: {predicted_ratings[i]}")
    print("——" * 20)


