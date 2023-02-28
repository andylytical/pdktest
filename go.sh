set -x 

DEBUG=0
GITREPO=https://github.com/puppetlabs/pdk-docker
GITBRANCH=CONT-521-update_image
REPO=puppet/pdk
TAG=$(date +%Y%m%d)

[[ "$DEBUG" -eq 1 ]] && set -x

build_image() {
  tmpdir=$( mktemp -d )
  git clone "${GITREPO}" --branch "${GITBRANCH}" --single-branch "${tmpdir}/TGT"
  pushd "${tmpdir}/TGT"
  docker build -t $REPO:$TAG .
  popd
  rm -rf "${tmpdir}"
}


run_docker() {
  docker run -it \
  --mount type=bind,src=$HOME,dst=/home \
  --entrypoint "/bin/bash" \
  $REPO:$TAG
}

build_image

run_docker
