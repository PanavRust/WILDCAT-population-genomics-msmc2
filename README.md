# 🧬 Population Genomics Analysis of Scottish Wildcats Using MSMC2

## 📌 Overview

This project presents a population genomics analysis aimed at reconstructing the demographic history and evolutionary divergence between Scottish wildcats (*Felis silvestris silvestris*) and domestic cats (*Felis catus*).

Using whole genome sequencing (WGS) data and the MSMC2 (Multiple Sequentially Markovian Coalescent) framework, the pipeline estimates historical effective population sizes (Ne) and infers patterns of divergence and potential hybridization.

This repository represents a structured and reproducible implementation of a typical MSMC2-based demographic inference workflow.

---

## 🧠 Background

Understanding historical population dynamics is critical for conservation genomics and evolutionary biology. MSMC2 models the coalescent process across genomes to infer changes in effective population size over time.

In the context of Scottish wildcats, such analyses are particularly important due to:

* population decline and fragmentation
* hybridization with domestic cats
* conservation efforts to preserve genetic integrity

---

## 🎯 Objectives

* Infer historical effective population size (Ne) trajectories
* Compare demographic histories between wildcat and domestic cat populations
* Generate MSMC2 input from variant data
* Visualize population size changes over time
* Demonstrate a reproducible population genomics workflow

---

## ⚙️ Workflow Overview

```text
VCF (Whole Genome Variants)
        ↓
Coverage Calculation (samtools)
        ↓
Mask Generation (callable regions)
        ↓
MSMC2 Input Preparation (multihetsep format)
        ↓
MSMC2 Demographic Inference
        ↓
Post-processing & Visualization (R)
```

---

## 🔬 Methodology

### 1. Coverage Calculation

Sequencing depth is calculated using `samtools depth` to identify callable genomic regions.

### 2. Mask Generation

Regions with adequate coverage (e.g., depth between 10–100×) are retained to generate mask files, ensuring that only high-confidence genomic regions are used for analysis.

### 3. MSMC2 Input Preparation

Variant data (VCF) is converted into MSMC2-compatible multihetsep format using `generate_multihetsep.py`, incorporating mask files to exclude low-confidence regions.

### 4. Demographic Inference

MSMC2 is used to infer coalescent rates and reconstruct historical effective population size trajectories.

### 5. Visualization

Output from MSMC2 is processed and visualized using R (ggplot2), producing log-scaled plots of effective population size over time.

---

## 🛠️ Tools & Technologies

| Tool        | Purpose               |
| ----------- | --------------------- |
| MSMC2       | Demographic inference |
| samtools    | Coverage calculation  |
| bcftools    | Variant processing    |
| Python      | Data preprocessing    |
| R (ggplot2) | Visualization         |
| Bash        | Workflow scripting    |

---

## 📁 Repository Structure

```text
wildcat-population-genomics-msmc2
│
├── scripts/
│   ├── generate_masks.sh      # Coverage-based mask generation
│   ├── prepare_input.sh       # MSMC2 input preparation
│   ├── run_msmc2.sh           # Demographic inference
│   └── plot_results.R         # Visualization of results
│
├── data/
│   └── example.vcf.gz         # Example input data
│
├── results/
│   └── msmc2_output.txt       # MSMC2 output
│
├── plots/
│   └── msmc2_population_history.png
│
└── README.md
```

---

## 📊 Output Interpretation

The MSMC2 output provides coalescent rate estimates that can be transformed into effective population size (Ne).

Typical interpretation includes:

* population bottlenecks → sharp declines in Ne
* population expansions → increases in Ne
* divergence events → separation of trajectories

---

## 📈 Example Visualization

The generated plots represent effective population size (Ne) over time on log-log scales, allowing interpretation of long-term demographic trends.

---

## ▶️ Running the Workflow (Example)

```bash
bash scripts/generate_masks.sh sample.bam sample
bash scripts/prepare_input.sh input.vcf.gz sample.mask.bed input.txt
bash scripts/run_msmc2.sh input.txt output
Rscript scripts/plot_results.R
```

---

## 🎯 Skills Demonstrated

* Population genomics analysis
* MSMC2-based demographic inference
* Handling large-scale genomic datasets
* Data preprocessing and filtering
* Bash and R scripting
* Scientific data visualization

---

## ⚠️ Limitations

* Simplified pipeline for demonstration purposes
* Assumes pre-processed and aligned genomic data
* Does not include phasing or multi-sample comparison

---

## ⚠️ Disclaimer

This project is intended for educational and demonstration purposes.
It does not represent a production or clinical-grade genomics pipeline.

---

## 👨‍💻 Author

**Panav Rustagi**
Bioinformatics Graduate – University of Bristol
Experience in genomic data analysis and bioinformatics workflows
