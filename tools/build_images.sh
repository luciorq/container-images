
cd ~/projects/docker_images

docker login --username luciorq

# For SRA tools
# docker run --rm -u $UID luciorq/sra-tools fasterq-dump --help
IMAGE_NAME=luciorq/sra-tools
IMAGE_VERSION=2.9.6
docker build --build-arg BUILD_VERSION=${IMAGE_VERSION} -t ${IMAGE_NAME}:${IMAGE_VERSION} dockerfiles/sra-tools
docker tag ${IMAGE_NAME}:${IMAGE_VERSION} ${IMAGE_NAME}:latest
docker push ${IMAGE_NAME}

# For STAR aligner
# docker run --rm -u $UID luciorq/star -h
IMAGE_NAME=luciorq/star
IMAGE_VERSION=2.7.1a
docker build --build-arg BUILD_VERSION=${IMAGE_VERSION} -t ${IMAGE_NAME}:${IMAGE_VERSION} dockerfiles/star
docker tag ${IMAGE_NAME}:${IMAGE_VERSION} ${IMAGE_NAME}:latest
docker push ${IMAGE_NAME}

# For SAMtools
# docker run --rm -u $UID luciorq/samtools samtools view --help
IMAGE_NAME=luciorq/samtools
IMAGE_VERSION=1.9
docker build --build-arg BUILD_VERSION=${IMAGE_VERSION} -t ${IMAGE_NAME}:${IMAGE_VERSION} dockerfiles/samtools
docker tag ${IMAGE_NAME}:${IMAGE_VERSION} ${IMAGE_NAME}:latest
docker push ${IMAGE_NAME}

# For Entrez-Direct
# docker run --rm -u $UID luciorq/entrez-direct /bin/bash -c "esearch -db gene -query "VAMP" | efetch -format xml"
IMAGE_NAME=luciorq/entrez-direct
IMAGE_VERSION=11.6
docker build --build-arg BUILD_VERSION=${IMAGE_VERSION} -t ${IMAGE_NAME}:${IMAGE_VERSION} dockerfiles/entrez-direct
docker tag ${IMAGE_NAME}:${IMAGE_VERSION} ${IMAGE_NAME}:latest
docker push ${IMAGE_NAME}
