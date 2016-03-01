[![DOI](https://zenodo.org/badge/7696/harnesscloud/iaas-deployment-docker-image.svg)](https://zenodo.org/badge/latestdoi/7696/harnesscloud/iaas-deployment-docker-image)

## Traffic Control rules branch

### Modifications

The purpose of this branch is to allow for the following modifications of the ``harness-iaas-services`` container:

1. Clone the appropriate irm-net branch that installs the``tc`` rules on containers.
2. Include a configuration file for irm-net.
3. Point irm-nova to install the appropriate ``conpaas-worker`` image that installs the ``tc`` default rules at boot-time.

### Building the image

The ``harness-iaas-services`` image should be built under the following name:

	docker build -t harnesscloud/iaas-deployment-docker-image-tcrules ./

### Pushing the image

Once the image has been build, push it to docker hub:

	docker login -e <username@example.org> -u <hub.docker username>
	docker push harnesscloud/iaas-deployment-docker-image-tcrules
