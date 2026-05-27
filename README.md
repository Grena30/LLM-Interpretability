## LLM Interpretability

This project studies how early in a model’s forward pass a correct prediction becomes reliable when product text is noisy. We inject realistic noise (markup, symbols, marketing phrases) into Amazon product data and measure **L\_suff** — the earliest layer where a target token reaches 90% of its final-layer probability. The analysis uses TransformerLens across multiple open-weight models (e.g., GPT‑2, Pythia, Gemma, Qwen, Llama) and summarizes results with per‑model statistics and plots.

---

### Notebooks

- `notebooks/dataset_analysis.ipynb` explores the raw dataset and generates noisy variants.
- `notebooks/llm_interpretability.ipynb` runs layer‑wise sufficiency analysis and saves per‑model CSV results and plots.
- `notebooks/accuracy.ipynb` aggregates the result CSVs and reports balanced accuracy, average confidence, and average L\_suff.

---

### Data

The raw dataset is the [Kaggle Amazon Sales Dataset](https://www.kaggle.com/datasets/karkavelrajaj/amazon-sales-dataset) and is stored at `data/01-raw/amazon.csv`. Derived outputs are written to:

- `data/03-results/` (per‑model CSVs, e.g., `layer_sufficiency_results_*.csv`)
- `model_statistics/` (plots)

---

### Quickstart

1. Create the virtual environment and install dependencies:
   ```bash
   make install
   source .venv/bin/activate
   ```
2. Add a Hugging Face token (required to download models):
   ```bash
   cp .env.example .env
   # edit .env and set HF_TOKEN=...
   ```
3. Launch JupyterLab and run the notebooks in order:
   ```bash
   jupyter lab
   ```
   Recommended order:
   1. `notebooks/dataset_analysis.ipynb`
   2. `notebooks/llm_interpretability.ipynb`
   3. `notebooks/accuracy.ipynb`

> Note: Model downloads can be large; a GPU (or Apple MPS) will speed up runs but is not required.
