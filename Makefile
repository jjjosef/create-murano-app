.PHONY: image

CONTAINER = create-murano-app
IMAGE = exosite/${CONTAINER}
USER = $(shell id -u):$(shell id -g)
VOLUME = ${PWD}:${PWD}
WORKDIR = ${PWD}

all: image container

image:
	docker build -t ${IMAGE} .

container:
	# docker run --interactive --name ${CONTAINER} --rm --tty --user ${USER} --volume ${VOLUME} --workdir ${WORKDIR} ${IMAGE} bash
	# docker run --interactive --name ${CONTAINER} --rm --tty --user ${USER} --volume ${VOLUME} --workdir ${WORKDIR} ${IMAGE} create-react-app test
	# cd test
	# docker run --interactive --name ${CONTAINER} --rm --tty --user ${USER} --volume ${VOLUME} --workdir ${WORKDIR} ${IMAGE} sh -c 'echo y | murano init'
	# docker run --interactive --name ${CONTAINER} --rm --tty --user ${USER} --volume ${VOLUME} --workdir ${WORKDIR} ${IMAGE} yo generator

clean:
	docker rm --force ${CONTAINER}
	rm -fr test
