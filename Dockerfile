FROM gcr.io/swift-tensorflow/base-deps-cuda10.2-cudnn7-ubuntu18.04

RUN apt-get update && apt-get install -y \
    libncurses5-dev python-pip && \
    rm -r /var/lib/apt/lists/* && \
    pip install numpy

# Install HDF5
RUN apt-get install -y libhdf5-dev

# Install Swift Ubuntu Snapshot
RUN SWIFT_ARCHIVE_NAME=swift-tensorflow-RELEASE-0.10-cuda10.2-cudnn7-ubuntu18.04.tar.gz && \
    SWIFT_URL=https://storage.googleapis.com/swift-tensorflow-artifacts/releases/v0.10/rc1/$SWIFT_ARCHIVE_NAME && \
    curl -O $SWIFT_URL && \
    tar -xvzf $SWIFT_ARCHIVE_NAME --directory / && \
    rm -rf $SWIFT_ARCHIVE_NAME /tmp/* /var/tmp/* && \
    chmod -R o+r /usr/lib/swift

# Print Installed Swift Version
RUN swift --version

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
