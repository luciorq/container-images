
```
mkdir dockerfiles/sra-tools
touch dockerfiles/sra-tools/Dockerfile
```
http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.9.6-1/sratoolkit.2.9.6-1-ubuntu64.tar.gz
https://github.com/ncbi/sra-tools/archive/2.9.6.tar.gz

# Building image

```bash
cd ~/projects/docker_images
docker build -t luciorq/sra-tools dockerfiles/sra-tools
```

# Running container

```
docker run --rm -u $UID luciorq/sra-tools fasterq-dump
```
