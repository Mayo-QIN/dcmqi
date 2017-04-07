# Build a CentOS based system

FROM mayoqin/grunt

LABEL maintainer "Korfiatis Panagiotis Korfiatis.Panagioits@mayo.edu"

RUN yum install -y wget
RUN yum install -y curl
RUN mkdir -p /grunt
WORKDIR /
RUN wget https://github.com/QIICR/dcmqi/releases/download/v1.0.5/dcmqi-linux.tar.gz
RUN gtar -xvzf dcmqi-linux.tar.gz -C /grunt
COPY dcmqi.gruntfile.yml /grunt.d/gruntfile.yml
# Configure Slicer environment
ENV PATH=/grunt/dcmqi-linux/bin:${PATH}
# What do we run on startup?
CMD ["/bin/grunt", "/grunt.d/gruntfile.yml"]
# We expose port 9901 by default
EXPOSE 9901:9901
