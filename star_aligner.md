# Installing STAR aligner

```bash
# Install pre-requisites
sudo apt-get update
sudo apt-get install \
  g++ \
  make

# Get latest STAR source from releases
wget https://github.com/alexdobin/STAR/archive/2.7.0b.tar.gz
tar -xzf 2.7.0b.tar.gz
cd STAR-2.7.0b

# Alternatively, get STAR source using git
git clone https://github.com/alexdobin/STAR.git

# Compile under Linux
# Compile
cd STAR/source
make STAR
```

# Building image

```bash
cd ~/projects/docker_images
docker build -t luciorq/star dockerfiles/star

```

# Running container

```
docker run --rm luciorq/star -h
```


