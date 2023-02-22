FROM sonatype/nexus3:3.38.0

ARG PLUGIN_VERSION=1.1.0
ENV PLUGIN_VERSION=${PLUGIN_VERSION}

# Download the Cloud Storage plugin
RUN curl -L -o /opt/sonatype/nexus/deploy/${PLUGIN_VERSION}/nexus-blobstore-google-cloud-${PLUGIN_VERSION}.kar \
    https://github.com/sonatype-nexus-community/nexus-blobstore-google-cloud/releases/download/${PLUGIN_VERSION}/nexus-blobstore-google-cloud-${PLUGIN_VERSION}.kar

# Install the Cloud Storage plugin
RUN echo 'reference\:file\:nexus-blobstore-google-cloud-${PLUGIN_VERSION}.kar = 200' >> /opt/sonatype/nexus/etc/karaf/startup.properties \
    && echo 'nexus-blobstore-google-cloud-${PLUGIN_VERSION}.kar = 200' >> /opt/sonatype/nexus/etc/karaf/startup.properties
