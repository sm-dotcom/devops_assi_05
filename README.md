For help, you can see Docker Docs and Ansible Docs, and complete your assignment. Thank you

Install Node.js, using Ansible roles on your local system (Please keep in mind you should understand the flow and syntax of the Ansible file) 
Use a multi-stage container approach.
Create a Dockerfile for the React application (you can get a sample code from any GitHub repo for the React application )
Create a React application Docker image from the Docker file
Push the Docker image to the Docker Hub
Use multi-stage Docker build (In your Docker file, you should need to use two images: one is a node and the other is Nginx
The application should be accessible locally at the port 
Create EC2 using terraform (Please use the instance type minimal )
Install Apache or nginx on the EC2 instance using Ansible, and then change the Apache port to 81 using the Ansible role 
Question: Why do we need to use a multi-stage Docker file?
