DEBUG=1

PUP_REPO=https://github.com/ncsa/puppet-profile_firewall
TGT=repo
APT=/usr/bin/apt
PDK=/opt/puppetlabs/pdk/bin/pdk


install_deps() {
  [[ $DEBUG -eq 1 ]] && set -x
  $APT update
  $APT install -y build-essential
  rm -rf /var/lib/apt/lists/*
}


get_repo() {
  [[ $DEBUG -eq 1 ]] && set -x
  git clone "$PUP_REPO" "$TGT"
}


validate() {
  [[ $DEBUG -eq 1 ]] && set -x
  pushd "$TGT"
  /opt/puppetlabs/pdk/bin/pdk validate
  popd
}


cleanup() {
  rm -rf $TGT
}

[[ $DEBUG -eq 1 ]] && set -x

[[ "$1" == "with_deps" ]] && install_deps

get_repo

validate

cleanup
