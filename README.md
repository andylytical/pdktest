# Run the test
### Build puppet-pdk and start a container from it:
1. `git clone https://github.com/andylytical/pdktest.git ~/pdktest`
1. `cd ~/pdktest`
1. `make test`

### In the docker container:
1. `bash /home/pdktest/runtest.sh`

### Use the workaround:
(still in the docker container)
1. `bash /home/pdktest/runtest.sh with_deps`

# Cleanup
1. `make clean`
