FROM r-base:4.3.0

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

RUN Rscript -e "install.packages(c('dplyr', 'rentrez', 'tibble', 'tidyr'))"

RUN Rscript -e "install.packages(c('devtools'))"

RUN Rscript -e "if (!require('BiocManager', quietly = TRUE)) install.packages('BiocManager'); BiocManager::install(version = '3.17')"

RUN Rscript -e "BiocManager::install('Biostrings', version = '3.17', force = TRUE, update = FALSE)"

RUN Rscript -e "BiocManager::install('GenomicRanges', version = '3.17', force = TRUE, update = FALSE)"

RUN Rscript -e "BiocManager::install('BSgenome', version = '3.17', force = TRUE, update = FALSE)"

CMD ["R", "--save"]
