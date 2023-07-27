FROM rocker/rstudio:4.3

LABEL maintainer="Javer A. Bosch <javier.a.bosch@gmail.com>"

RUN apt-get update && apt-get install -y --no-install-recommends \
        libgit2-dev \
        libxml2-dev \
        libudunits2-dev \
        libgdal-dev \
        libcairo2-dev \
        libxt-dev \
        libv8-dev \
        r-cran-rcpp \
        r-cran-inline \
        r-cran-rcpp \
        libpoppler-cpp-dev \
        libtesseract-dev \
        libleptonica-dev \
        tesseract-ocr-eng \
        libmagick++-dev \
        libavfilter-dev \
        libzmq3-dev \
    	mesa-common-dev \
    	libglu1-mesa-dev \
        cargo \
        curl \
        tree \
        jq \
        htop \
        texinfo \
        vim \
        man-db \
        less \
		&& apt-get clean all && \
    	apt-get purge && \
    	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV POSIT_BUILD_DATE=2023-04-25

# Install Basic Utility R Packages
# OLD - https://cran.microsoft.com/snapshot/
RUN install2.r -r https://packagemanager.posit.co/cran/${POSIT_BUILD_DATE} \
	--error \
	rgl \
	data.table

RUN install2.r -r https://packagemanager.posit.co/cran/${POSIT_BUILD_DATE} -n -1 \
	--error \
	R6 \
	readr \
	caret \
	tidymodels \
	randomForest \
	feasts \
	cluster \
	fable \
	stringr \
	jsonlite \
	knitr 

RUN install2.r -r https://packagemanager.posit.co/cran/${POSIT_BUILD_DATE} -n -1 \
	--error \
	shiny \
	shinyWidgets \
	shinydashboardPlus \
	shinyFeedback \
	shinyEffects \
	shinycssloaders \
	flexdashboard \
	shinyalert \
	kableExtra \
	reprex \
	clipr \
	httr \
	curl \
	RCurl \
	here \
	janitor \
	qs \
	future.callr \
	tsibble \ 
	RPostgres \
	furrr

# RUN install2.r -r https://packagemanager.posit.co/cran/${POSIT_BUILD_DATE} -n -1 \	
# 	profvis \
# 	bookdown \
# 	blogdown \
# 	targets \ 
# 	future \ 
# 	future.callr \
# 	curl \
# 	bit64 \
# 	getPass \
# 	RCurl \
# 	assertive \
# 	pool \
# 	skimr \

# # Plotting Packages
RUN install2.r -r https://packagemanager.posit.co/cran/${POSIT_BUILD_DATE} -n -1 \
	--error \
	lattice \
	ggplot2 \
	GGally \
	ggfortify \
	ggExtra \
	DiagrammeR \
	patchwork \
	plotly \
	txtplot \
	billboarder \
	timevis

RUN mkdir dotfiles
COPY dotfiles dotfiles/

RUN mkdir -p /home/rstudio/.R/snippets \
	&& mkdir -p /home/rstudio/.R/rstudio/keybindings \
	&& cp -r dotfiles/.Rprofile /home/rstudio/ \
	&& cp -r dotfiles/r.snippets /home/rstudio/.R/snippets/ \
	&& cp dotfiles/keybindings/*.* /home/rstudio/.R/rstudio/keybindings/

WORKDIR /home/rstudio