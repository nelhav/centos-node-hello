FROM    centos:centos6

# Enable Extra Packages for Enterprise Linux (EPEL) for CentOS
RUN     yum install -y epel-release
# Install Node.js and npm
RUN     yum install -y nodejs npm

# Install app dependencies
COPY /centos-node-hello/src/package.json /centos-node-hello/src/package.json
RUN cd /centos-node-hello/src; npm install

# Bundle app source
COPY . /centos-node-hello/src

EXPOSE  8080
CMD ["node", "/centos-node-hello/src/index.js"]
