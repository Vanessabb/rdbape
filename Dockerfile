FROM r-base:4.4.1

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		libhiredis-dev \
		libssl-dev \
		libsasl2-dev \
    		libxml2-dev \
      		libfontconfig1-dev \
		libcurl4-openssl-dev \
	&& rm -rf /var/lib/apt/lists/*

RUN Rscript -e "install.packages(c('R6', 'iterators', 'foreach'))"

RUN Rscript -e "install.packages(c('redux', 'doRedis', 'openssl', 'mongolite', 'tidyr', 'readr'))"

RUN Rscript -e "install.packages(c('R.utils', 'XML', 'ape', 'data.table'))"

RUN Rscript -e "install.packages(c('dplyr', 'rentrez', 'tibble'))"

RUN Rscript -e "install.packages(c('devtools', 'base64enc'))"

RUN Rscript -e "install.packages(c('inline', 'combinat'))"

RUN Rscript -e "if (!require('BiocManager', quietly = TRUE)) install.packages('BiocManager'); BiocManager::install(version = '3.19', ask = FALSE)"

RUN Rscript -e "BiocManager::install('Biostrings', version = '3.19', force = TRUE, update = FALSE)"

RUN Rscript -e "BiocManager::install('GenomicRanges', version = '3.19', force = TRUE, update = FALSE)"

RUN Rscript -e "BiocManager::install('BSgenome', version = '3.19', force = TRUE, update = FALSE)"

RUN Rscript -e "BiocManager::install('universalmotif', version = '3.19', force = TRUE, update = FALSE)"

RUN Rscript -e "BiocManager::install('pwalign', version = '3.19', force = TRUE, update = FALSE)"

CMD ["/bin/bash"]
