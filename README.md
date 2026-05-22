# Protein-Protein Interaction Network Analysis for Endometriosis

Social Network Analysis course project, University of Warsaw MIMUW, 2026. Author: Agata Kopeć, 469385.

## Research question

Which set of k proteins, when blocked simultaneously, most effectively limits the propagation of the disease signal in the endometriosis PPI network, and does the optimal set depend on the chosen measure?

## Key findings

- Greedy iterative betweenness dominates as a blocking strategy, saturating at k near 200 with 99 percent spread reduction under both SIR and Independent Cascade propagation.
- Selection algorithm shapes the recommended set as strongly as the underlying biology: the two CELF chains share zero proteins with each other or with the structural chains in their top-10, and 93 percent of top-20 picks are algorithm-specific.
- The endometriosis PPI is 7.8 percentage points more resistant to targeted betweenness disruption than its degree-randomized configuration null, evidence of structural redundancy beyond what the degree distribution alone provides.

## Reproducing

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r src/requirements.txt
jupyter notebook src/endo.ipynb
```

Restart kernel and run all cells. Randomness is seeded with `RANDOM_SEED = 42`; subsequent runs produce byte-identical chains and figures. STRING is fetched once on first execution and cached to `src/results/string_network.tsv`.

Full methodology, calibration sweeps, and limitations are documented inline in `src/endo.ipynb` and in the report.

## Data sources

- Genes: DisGeNET, UMLS concept C0014175 endometriosis, score >= 0.25, curated, human taxon 9606.
- Interactions: STRING, confidence >= 0.4, first-shell expansion at add_nodes = 300.
