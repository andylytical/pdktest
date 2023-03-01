set -x 

DEBUG=1
GITREPO=https://github.com/puppetlabs/pdk-docker
GITBRANCH=CONT-521-update_image
REPO=puppet/pdk
TAG=$(date +%Y%m%d)

build_image() {
  [[ "$DEBUG" -eq 1 ]] && set -x
  tmpdir=$( mktemp -d )
  git clone "${GITREPO}" --branch "${GITBRANCH}" --single-branch "${tmpdir}/TGT"
  pushd "${tmpdir}/TGT"
  docker build -t $REPO:$TAG .
  popd
  rm -rf "${tmpdir}"
}


run_docker() {
  [[ "$DEBUG" -eq 1 ]] && set -x
  docker run -it \
  --mount type=bind,src=$HOME,dst=/home \
  --entrypoint "/bin/bash" \
  $REPO:$TAG
}

[[ "$DEBUG" -eq 1 ]] && set -x

build_image

run_docker
