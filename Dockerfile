# The docker file describes the docker image with
# Linux Full Duplex Interface built and deployed

FROM bosch-linux-ext-modules-build:latest AS bosch-linux-full-duplex-interface

ENV repo_path=/repos/full-duplex-if

RUN rm -rf ${repo_path} && mkdir -p ${repo_path}

WORKDIR ${repo_path}
COPY . .

### BUILD CONFIGURATIONS ###

# Base (default) version
ARG kernel_version=5.15.0-25-generic
ARG kernel_source_dir=/lib/modules/${kernel_version}/build

RUN make KVER=${kernel_version} \
    && make KVER=${kernel_version} install \
