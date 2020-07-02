# GroupProject

The Devops Final Project for QA consulting.

## Index

1. [Brief](#Brief)
2. [Architecture](#Architecture)
3. [Risk Assessment](#Risk-Assessment)
4. [Sprints and Results](#Sprints-and-Results)
5. [Bugs and Fixes](#Bugs-and-Fixes)
6. [Costs](#Costs)
7. [Workflow and Tools](#Workflow-and-Tools-Used)
8. [Future Improvements](#Improvements-to-Make-in-the-Future)
9. [Acknowledgements](#Acknowledgements)



## Brief

Plan, design and implement a solution for automating the development workflows and deployments for the spring pet clinic application. It must have multi environment support and automatically build and deploy to test and live environments when changes are made and oushed to github. The costs for the project need to be calculated and all tools to be used must be chosen by us.

## Architecture




[Back to top](#Index)

### CI Pipeline



![Trello Board](https://github.com/oskar951/SFIA2/blob/master/Images/Pipeline.jpg)

### Trello Project Tracking

Using Trello, we tracked the project along the way with a Kanban style board which allowed us to see the progress and things that need to be done. Here is the inital board which shows the tasks that need to be done, some that are already in progress and others that had already been done such as setting up github. Our first sprint has also been outlined:

![Trello Board](https://github.com/oskar951/GroupProject/blob/master/Images/Trello1.jpg)

This is the board throughout the project when some things were in progress and others completed. 
![Trello Board](https://github.com/oskar951/GroupProject/blob/master/Images/Trello2.jpg)

In the final board everything is complete apart from the documentation to which we are adding finishing touches. 
![Trello Board](https://github.com/oskar951/GroupProject/blob/master/Images/Trello3.jpg)

## MoSCoW

### Must Have
* Kanban style board for project tracking
* Version control system using the feature branch model to implement developing code
* CI server to automatically build and deploy software to a cloud hosted machine
* Docker for containerisation
* Docker swarm for container orchestration 
* Ansible for configuring and deploying the application
* 4 micro services which work together, are load balanced and replicated throughout nodes in order to stay up whilst being updated

### Should Have
* Clear and detailed documentation showing progress throughout the project and testing
* The applciation provides an outcome dependant on rules
* Designs for the project before it is started
* Webhooks so that jenkins can build instantly when github has been updated

### Could Have
* More complicated service which asks for user input as well as providing the user with a generated output
* Full CRUD funcionality
* Security through proper firewall use and changing of passwords

### Wont Have
* Extra functionality allowing people to up or down vote the usernames that they get so that more popular name combinations can be provided
* Fully integrated autoamtic testing with 100% coverage


## Risk Assessment

In my risk assessment I have listed possible risks with the project. I added the risks cause and effect as well as the likelihood of it happening, this is then followed by a control measure which can help negate the risk and give it a lower likelihood and consequence. 

![Risk Assessment](https://github.com/oskar951/SFIA2/blob/master/Images/RiskAssessment1.jpg)

I then reviewed my risks towards the end of the project to see which control measures are implemented and whether I avoided those risks or not.

![Risk Assessment2](https://github.com/oskar951/SFIA2/blob/master/Images/RiskAssessment2.jpg)

Here is my Risk Matrix with some of them added in:

![Risk Matrix](https://github.com/oskar951/SFIA2/blob/master/Images/RiskMatrix.jpg)

## Sprints and Results


## Bugs and Fixes




## Costs

Budget = £20



[Back to top](#Index)

## Workflow and Tools Used



![WorkFlow](https://github.com/oskar951/SFIA2/blob/master/Images/)

* SQL - Database service
* Jenkins - Continues Integration and Deployment server
* Git - Versions Control System
* Trello - Project Tracking
* Terraform - Controlling infrastructure for AWS
* Kubernetes - Application container deployment
* Docker - Containerisation tool
* Ansible - Configuration and deployment tool
* NGINX - Reverse proxy web server

## Improvements to Make in the Future



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
