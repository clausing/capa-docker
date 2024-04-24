# capa-docker

Run Mandiant's capa tool in a docker container 

# Usage

This docker image will run `capa` against the file or directory on the host

`docker run -it --rm -v /capa-rules:/rules -v ${PWD}:/app clausing/capa [switches] <file>`
