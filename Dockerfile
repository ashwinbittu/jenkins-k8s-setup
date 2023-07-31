FROM jenkins/inbound-agent:4.11.2-4
USER root
RUN apt-get update && apt-get install python3-pip toilet curl awscli jq  -y && pip install --upgrade pip
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-20.10.9.tgz \
  && tar xzvf docker-20.10.9.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-20.10.9.tgz
RUN pip install boto3 pyaml
RUN apt install amazon-ecr-credential-helper -y
COPY . /.
