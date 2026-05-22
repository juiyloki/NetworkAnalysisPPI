# Protein-Protein Interaction Network Analysis for Endometriosis

Social Network Analysis course final project, MIMUW University of Warsaw, 2026. Author: Agata Kopeć, 469385.

## Research question

Which set of k proteins, when blocked simultaneously, most effectively limits the propagation of the disease signal in the endometriosis PPI network, and does the optimal set depend on the chosen measure?

## Key findings

- Greedy iterative betweenness dominates as a blocking strategy and saturates at k around 200 with 99 percent spread reduction under both SIR and Independent Cascade propagation.
- Selection algorithm shapes the recommended set as strongly as the underlying biology: the two CELF chains share zero proteins with each other or with the structural chains in their top-10, and 93 percent of top-20 picks are algorithm-specific.
- The endometriosis PPI is 7.8 percentage points more resistant to targeted betweenness disruption than its degree-randomized configuration null, evidence of structural redundancy beyond what the degree distribution alone provides.

## Repository layout

```
raport.pdf, slides.pdf, notes.pdf    built artifacts at repo root
src/endo.ipynb                       analysis notebook with inline prose
src/requirements.txt                 pinned dependencies
src/data/                            DisGeNET search metadata and gene table
src/results/string_network.tsv       STRING first-shell network, cached
src/results/figures/                 four figure PDFs exported from the notebook
src/tex/raport.tex                   project report
src/tex/slides.tex                   beamer presentation
src/tex/notes.tex                    standalone printable speaker notes
src/tex/refs.bib                     shared bibliography
src/tex/compile.sh                   Tectonic build script
src/tex/tau-class/                   third-party report template (Tau v2.6.0, CC BY 4.0)
```

## Reproducing the analysis

```
python -m venv .venv
source .venv/bin/activate
pip install -r src/requirements.txt
jupyter notebook src/endo.ipynb
```

Restart the kernel and run all cells. Randomness is seeded with RANDOM_SEED set to 42, so subsequent runs produce byte-identical chains and figures. STRING is fetched once on first execution and cached to src/results/string_network.tsv.

## Rebuilding the LaTeX artifacts

```
./src/tex/compile.sh -all
```

Single-target flags are also available: -raport, -slides, -notes. Tectonic is the only system dependency.

## Data sources

- Genes: DisGeNET, UMLS concept C0014175 endometriosis, score at least 0.25, curated source, human taxon 9606.
- Interactions: STRING, confidence at least 0.4, first-shell expansion with add_nodes set to 300.

## License

Apache 2.0, see LICENSE.
