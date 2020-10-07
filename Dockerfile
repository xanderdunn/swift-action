FROM gcr.io/swift-tensorflow/base-deps-cuda10.2-cudnn7-ubuntu18.04

RUN apt update
RUN apt install -y -V ca-certificates lsb-release wget
RUN wget https://apache.bintray.com/arrow/$(lsb_release --id --short | tr 'A-Z' 'a-z')/apache-arrow-archive-keyring-latest-$(lsb_release --codename --short).deb
RUN apt install -y -V ./apache-arrow-archive-keyring-latest-$(lsb_release --codename --short).deb
RUN apt update
RUN apt install -y -V libarrow-glib-dev

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
