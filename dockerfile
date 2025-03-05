# Base image for R and Shiny
FROM rocker/shiny

# Install required R packages
RUN R -e "install.packages(c('shiny', 'dplyr', 'ggplot2', 'data.table', 'caret'))"

# Copy project files into the container
COPY . /home/rprojects

# Set working directory
WORKDIR /home/rprojects

# Expose port 3838 for Shiny
EXPOSE 3838

# Run the Shiny app
CMD ["R", "-e", "shiny::runApp('/home/rprojects', host='0.0.0.0', port=3838)"]
