# GroupProject

Week 12 Devops Final Project

## Index

1. [Brief](#Brief)
2. [Architecture](#Architecture)
3. [Risk Assessment](#Risk-Assessment)
4. [Sprints and Results](#Sprints-and-Results)
5. [Bugs and Fixes](#Bugs-and-Fixes)
6. [Costs](#Costs)
7. [Future Improvements](#Improvements-to-Make-in-the-Future)
8. [Acknowledgements](#Acknowledgements)



## Brief

Plan, design and implement a solution for automating the development workflows and deployments for the spring pet clinic application. It must have multi environment support and automatically build and deploy to test and live environments when changes are made and pushed to github. The costs for the project need to be calculated and all tools to be used must be chosen by us, although we have to use AWS as our hosting platform.

Our group was also given the additional tasks of setting up disaster recovery and monitoring

## Architecture

We ended up choosing the following tools:

* MySQL through AWS RDS - Database service
* Jenkins - Continuous Integration and Deployment server
* Git - Versions Control System
* Trello - Project Tracking
* Terraform - Controlling infrastructure for AWS
* Docker Swarm - Application container deployment
* Docker - Containerisation tool
* Docker Compose - Containerisation orchestration tool
* NGINX - Reverse proxy web server

Our original plan was to use Kubernetes as our Application container deployment tool but we had to switch to Docker Swarm due to repeated issues that were taking up all of our time

![CI pipeline](https://github.com/oskar951/GroupProject/blob/master/Images/ColouredPipeline.jpg)

Our source code is pushed via Git to GitHub. When this is merged into the master branch, a webhook is triggered which activates the Jenkins server. Jenkins then sets up the environment if not already done via Terraform and builds the new docker images before uploading them to dockerhub. A docker swarm is started if not already present and the instances are distributed over the nodes

![CI pipeline](https://github.com/oskar951/GroupProject/blob/Development/Images/DockerPipeline.jpg)

On the AWS side, we have a VPC with a single security group that contains everything. RDS hosts the MySQL database persistently to allow the EC2 instances to access the data. All of the nodes are all running on T2 micros to save on costs. The website isn't accessible normally from the public internet, but the internet gateway accepts HTTP traffic which is passed to the app through an NGINX reverse proxy

![AWS architecture](https://github.com/oskar951/GroupProject/blob/master/Images/aws.png)

We have monitoring features to increase uptime. Regular snapshots of the cluster are taken and stored in an S3 bucket. Cloudwatch monitors the health of each EC2 instance and if there is cause for concern, triggers a lambda function that spins up a replacement EC2 before taking down the unhealthy one. Cloudtrail is used on the IAM roles to track any malicious activity, and the IAM roles are given the minimum permissions required to do their job


### Trello Project Tracking

Using Trello, we tracked the project along the way with a Kanban style board which allowed us to see the progress and things that need to be done. Here is the inital board which shows the tasks that need to be done, some that are already in progress and others that had already been done such as setting up github. Our first sprint has also been outlined:

![Trello Board](https://github.com/oskar951/GroupProject/blob/master/Images/Trello1.jpg)

This is the board throughout the project when some things were in progress and others completed. New tasks had been added now that we fully understood what was required of us and what we wanted to do 
![Trello Board](https://github.com/oskar951/GroupProject/blob/master/Images/trello2.jpg)

## MoSCoW

### Must Have
* Fully functional dockerised application
* Persistent database
* Automatic deployment
* Automatic allocation

### Should Have
* Have disaster recovery
* Have monitoring of both IAM users and infrastructure


### Could Have
* Use of NGINX reverse proxy to make the site easier to access
* Increased security for IAM users through two factor authentication


### Want to Have
* High availability
* Multiple regions to reduce latency and provide an extra layer of redundancy

## Risk Assessment

In our risk assessment we have listed possible risks with the project. We added the risks cause and effect as well as the likelihood of it happening, and what we can do to help negate the risk and give it a lower likelihood and consequence. 

![Risk Assessment](https://github.com/oskar951/GroupProject/blob/master/Images/risk%20assesment%201.png)

We then reviewed my risks towards the end of the project to see which control measures are implemented and whether we avoided those risks or not.

![Risk Assessment2](https://github.com/oskar951/GroupProject/blob/master/Images/risk%20assesment%202.png)

## Sprints and Results
### Sprint 1

Our goals for this sprint were to get the app working together and dockerised, and the AWS environment set up

We finished this quite early, but we didn't end the sprint to tasks for later sprints bled in, namely documentation, NGINX, extra features and other MVP tasks that should have been for the next sprint. This meant that when we moved onto the next sprints we had a head start, but also that our work wasn't fully focused on the immediate tasks in this sprint

### Sprint 2

Our goals for this sprint were to complete the MVP including all documentation to pass the project and allow us to use the rest of the time to add additional features

Due to being rate limited by bugs stopping the build from working, some tasks were out of reach. In that time we did documentation and additional tasks originally meant for sprint 3. We were forced to change the plan and switch to Docker Swarm due to massive issues with kubernetes preventing us from progressing

### Sprint 3

Our goals for this sprint were to fully implement the additional tasks, to test everything is working and to practice our presentation

Due to the additional tasks and presentation being largely finished during sprint 2 (largely due to it taking extra time because of the kubernetes bug), this was fairly easy. We just had to work out who was saying what and who was demonstrating each part of the project

## Bugs and Fixes
NGINX bad gateway bug - The error was due to the NGINX file not specifying the IP to activate the proxy from when triggered. This was discovered and solved by learning how NGINX works as a program

AWS EKS Access Denied bug - The cluster didn't permit access from a root user for some reason. swapping from eu-west-2 to eu-west-1 fixed this, although we're still not sure why

Front end not working in kubernetes bug - The front end wasn't accessable through kubernetes. rebuilding the application fixed this. we think there is old code being retained because running it on a new environment worked with no issues

## Costs

Our budget for this project was £20. We ended up spending $1.94/£1.55, coming in well under budget

Our estimated running costs for a month of uptime are ~$113

It is impossible to calculate the costs for a serverless equivalent without assuming a number of visits per month, but the less views per month the website achieves, the cheaper it will be to access. This also comes at the cost of performance so isn't worth it for a website in many cases

To reduce monthly costs, we could opt to not use EKS to manage the kubernetes cluster and do it ourselves, but this would of course result in more work being spent by people which is often a bad trade off

## Improvements to Make in the Future

In the future we would have the application in multiple regions to reduce latency on the customer end

## Acknowledgements

Thanks to the Trainers for the knowledge used to build and document this project.

Also thanks to the group for working well together and completing tasks.

**Written and Produced by** - *Group 1: Hamza Yacub, Monsif Seaton, Harpreet Jhita, Oskar Ceremnovas* 

#### MIT License

Copyright (c) 2020 oskar951

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
