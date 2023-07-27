# Build Docker Rstudio Images Using Posit Package Manager from CRAN Snapshots

```
docker build -t rstudioDocker:latest -t rstudioDocker:v4.3 .
```

# Run Docker and bind mount your current working directory. 
```
docker run --rm \
           -p 8787:8787 \
           -v "$(pwd)":/home/rstudio \
           -e DISABLE_AUTH=true \
           rstudio
```

## Credits

Inspiration for `dotfiles/` and `R packages` taken from Rahul Sangole. [Github](https://github.com/rsangole) and [Repo](https://github.com/rsangole/docker) 