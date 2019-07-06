# Funcion definition
build_docker_images() {
  echo "First argument is as $1"
  echo "Second argument is as $2"

  IMAGE_NAME="$1"
  IMAGE_VERSION="$2"

  echo "### Building image $IMAGE_NAME v. $IMAGE_VERSION ###"
  docker build --build-arg BUILD_VERSION=${IMAGE_VERSION} \
    -t ${IMAGE_NAME}:${IMAGE_VERSION} dockerfiles/$(basename $IMAGE_NAME)
  docker tag ${IMAGE_NAME}:${IMAGE_VERSION} ${IMAGE_NAME}:latest
  docker push ${IMAGE_NAME}
}

cd ~/projects/docker_images

docker login --username luciorq


# For SRA tools
# docker run --rm -u $UID luciorq/sra-tools fasterq-dump --help
build_docker_images luciorq/sra-tools 2.9.6


# For STAR aligner
# docker run --rm -u $UID luciorq/star -h
build_docker_images luciorq/star 2.7.1a

# For SAMtools
# docker run --rm -u $UID luciorq/samtools samtools view --help
build_docker_images luciorq/samtools 1.9

# For Entrez-Direct
# docker run --rm -u $UID luciorq/entrez-direct /bin/bash -c "esearch -db gene -query "VAMP" | efetch -format xml"
build_docker_images luciorq/entrez-direct 11.6

# For Trimmomatic
# docker run --rm -u $UID luciorq/trimmomatic -version
build_docker_images luciorq/trimmomatic latest

# For Trimmomatic
# docker run --rm -u $UID luciorq/trimmomatic -h
#build_docker_images luciorq/bowtie2 XXXXX-x




