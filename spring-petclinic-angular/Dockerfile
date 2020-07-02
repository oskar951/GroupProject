FROM node:latest
RUN mkdir /opt/petclinic/
WORKDIR /opt/petclinic/
COPY package.json /opt/petclinic/package.json
RUN npm install
RUN npm install -g @angular/cli@latest
COPY . /opt/petclinic/
EXPOSE 4200
CMD ng serve