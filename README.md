
# Working Software Monolith

Hi 🥳,
This repo is meant to allow anyone to deploy their own application.
There's a github action pipeline that will do the following after each commit:

 1. Build a Dockerfile in the root of this repo
 2. Push the Docker image to a container registry
 3. Deploy the created image to a Kubernetes cluster

## How to deploy your monolith:


1. Clone this project 

2. Create a new Dockerfile in the root directory
	1. The Dockerfile must expose port 80 
	2.  The name should be "Dockerfile", feel free to overwrite the existing one

3. Run the docker build **before push** to check if it builds correctly with the following commands: 
	
		 docker build -t example-image .
		 docker run -p 8080:80 example-image


4. Commit and push 🗿.
