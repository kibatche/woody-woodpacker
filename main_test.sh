docker build -t woody-temp-image . && \
docker run --rm -it \
  -v "$PWD/results:/results" \
  woody-temp-image && \
docker rmi woody-temp-image
