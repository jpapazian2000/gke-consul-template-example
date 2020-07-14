From nginx:latest
ARG      CONSUL_TEMPLATE_VERSION=0.25.0
ADD 	 https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip /usr/bin/
RUN 	 apt-get update && \
         apt-get install -y unzip && \
         unzip /usr/bin/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
    	 mv consul-template /usr/local/bin/consul-template && \
    	 rm -rf /usr/bin/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip

