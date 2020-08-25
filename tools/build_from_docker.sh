# create singularity repo
SINGULARITY_REPO=/data/singularity_images

mkdir -p $SINGULARITY_REPO

# Funcion definition
build_from_docker() {
  echo "First argument is as $1"
  echo "First argument is as $2"
  IMAGE_NAME="$1"
  VERSION_COMMAND=$2

  docker pull ${IMAGE_NAME}
  IMAGE_VERSION=$(docker run --rm ${IMAGE_NAME} ${VERSION_COMMAND})
  echo ${IMAGE_VERSION}
  IMAGE_VERSION=$(echo ${IMAGE_VERSION} | cut -d' ' -f2)
  echo ${IMAGE_VERSION}
  BASE_NAME=$(basename ${IMAGE_NAME})

  echo "### Building image ${IMAGE_NAME} v. ${IMAGE_VERSION} ###"
  docker tag ${IMAGE_NAME}:latest ${IMAGE_NAME}:${IMAGE_VERSION}
  # Get docker image to singularity
  # Build singularity image from a docker image
  sudo singularity build \
    ${SINGULARITY_REPO}/${BASE_NAME}_${IMAGE_VERSION}.sif \
    docker://${IMAGE_NAME}
}

#
build_from_docker combinelab/salmon "salmon --version"
