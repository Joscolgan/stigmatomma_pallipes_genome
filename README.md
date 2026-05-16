### Context & Citation:
## Unmated queens show worker-like behaviour and gene expression in polygynous colonies of the ant _Stigmatomma pallipes_  

This repository contains scripts related to the assessment and assembly of ONT reads for the ant _Stigmatomma pallipes_. Findings of the analysis are reported in the following manuscript:

MF Bolder, JS Möllmann, TJ Colgan, R Libbrecht. (Unmated queens show worker-like behaviour and gene expression in polygynous colonies of the ant _Stigmatomma pallipes_)[https://doi.org/10.1111/mec.70360].  

## Steps in the analysis  
### 1. Quality assessment of raw sequences:  
- [NanoPlot](https://github.com/wdecoster/NanoPlot)  

### 2. Filtering of low quality reads:  
- [Chopper](https://github.com/wdecoster/chopper)  

### 3. _de novo_ assembly:  
- [Flye](https://github.com/mikolmogorov/Flye)

### 4. Assembly assessment:  
- [Quast](https://github.com/ablab/quast)  

### 5. Polishing:  
Polishing of the genome assembly was performed using a combination of Racon and Medaka:  
Three founds of Racon, which involves a combination of mapping reads back using [minimap2](https://github.com/lh3/minimap2) against a polished genome assembly.  
- [Racon](https://github.com/isovic/racon)  

- [Medaka](https://github.com/nanoporetech/medaka)  

### 6. Genome completeness assessment:  
- [BUSCO](https://busco.ezlab.org/)

### 7. Repeat masking:  
- [Repeatmodeler](https://www.repeatmasker.org/) to construct a set of possible repeats.  
- [Repeatmasker](https://www.repeatmasker.org/) to soft mask.  

### 8. Contig filtering:  
Samtools coverage was used to estimate coverage per scaffold.  
Using mean mapping quality (less than 30), contigs were removed from the final assembly.  

