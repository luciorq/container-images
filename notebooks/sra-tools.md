
```
mkdir dockerfiles/sra-tools
touch dockerfiles/sra-tools/Dockerfile
```
https://github.com/ncbi/sra-tools/archive/2.9.4.tar.gz

# Building image

```bash
cd ~/projects/docker_images
docker build -t luciorq/sra-tools dockerfiles/sra-tools
```

# Running container

```
docker run --rm -u $UID luciorq/sra-tools fasterq-dump
```
