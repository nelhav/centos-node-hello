FROM    centos:centos6

# Enable Extra Packages for Enterprise Linux (EPEL) for CentOS
RUN     dnf install epel-release epel-next-release
# Install Node.js and npm
RUN     dnf install -y nodejs npm

# Install app dependencies
COPY /src/package.json /src/package.json
RUN cd /src; npm install

# Bundle app source
COPY . /src

EXPOSE  8080
CMD ["node", "/src/index.js"]
