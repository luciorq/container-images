SINGULARITY_REPO=/data/singularity_images
mkdir -p ${SINGULARITY_REPO}
#sudo singularity build \
#  ${SINGULARITY_REPO}/$(basename $IMAGE_NAME)_${IMAGE_VERSION}.sif \
#  docker://luciorq/$(basename $IMAGE_NAME):${IMAGE_VERSION}

# Funcion definition
build_images() {
  echo "First argument is as $1"
  echo "Second argument is as $2"

  IMAGE_NAME="$1"
  IMAGE_VERSION="$2"

  echo "### Building image $IMAGE_NAME v. $IMAGE_VERSION ###"
  DOCKER_BUILDKIT=1 docker build --build-arg BUILD_VERSION=${IMAGE_VERSION} \
    -t ${IMAGE_NAME}:${IMAGE_VERSION} dockerfiles/$(basename $IMAGE_NAME)
  docker tag ${IMAGE_NAME}:${IMAGE_VERSION} ${IMAGE_NAME}:latest
  docker push ${IMAGE_NAME}
  sudo singularity build \
    ${SINGULARITY_REPO}/$(basename $IMAGE_NAME)_${IMAGE_VERSION}.sif \
    docker://luciorq/$(basename $IMAGE_NAME):${IMAGE_VERSION}
}

build_test() {
  echo "First argument is as $1"
  echo "Second argument is as $2"

  IMAGE_NAME="$1"
  IMAGE_VERSION="$2"

  echo "### Building image $IMAGE_NAME v. $IMAGE_VERSION ###"
  DOCKER_BUILDKIT=1 docker build --build-arg BUILD_VERSION=${IMAGE_VERSION} \
    -t ${IMAGE_NAME}:${IMAGE_VERSION} dockerfiles/$(basename $IMAGE_NAME)
}

# cd ~/projects/docker_images

docker login --username luciorq

# For SRA tools
# docker run --rm -u $UID luciorq/sra-tools fasterq-dump --help

#build_images luciorq/sra-tools 2.10.7
build_images luciorq/sra-tools latest

# For STAR aligner
# docker run --rm -u $UID luciorq/star -h
build_images luciorq/star 2.7.3a

# For SAMtools
# docker run --rm -u $UID luciorq/samtools samtools view --help
# docker run --rm -u $UID luciorq/samtools bcftools --help
build_images luciorq/samtools 1.10

# For Entrez-Direct
# docker run --rm -u $UID luciorq/entrez-direct /bin/bash -c "esearch -db gene -query "VAMP" | efetch -format xml"
build_images luciorq/entrez-direct 13.8

# For Trimmomatic
# docker run --rm -u $UID luciorq/trimmomatic -version
build_images luciorq/trimmomatic latest

# For Bowtie2
# docker run --rm -u $UID luciorq/bowtie2 -h
build_images luciorq/bowtie2 2.3.5.1

# For rMATS with turbo
# docker run --rm -u $UID --entrypoint run_rmats luciorq/rmats:4.1.0 --version
# docker run --rm -u $UID luciorq/rmats run_rmats -h
build_images luciorq/rmats 4.1.0

# For deeptools
# docker run --rm -u $UID luciorq/deeptools bamCoverage -h
# docker run --rm -u $UID luciorq/deeptools bamCoverage --version
build_images luciorq/deeptools 3.4.3

# For minimap2
# docker run --rm -u $UID luciorq/minimap2 minimap2 -h
# docker run --rm -u $UID luciorq/minimap2 --version
build_images luciorq/minimap2 2.17

# For fastqc
# docker run --rm -u $UID luciorq/fastqc --version
# singularity exec /data/singularity_images/fastqc_0.11.9.sif fastqc -v
# build_test luciorq/fastqc 0.11.9
build_images luciorq/fastqc 0.11.9
