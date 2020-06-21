FROM gcr.io/cloud-builders/gcloud

VOLUME /root/.ssh
COPY entry_point.sh /usr/bin

ENTRYPOINT ["/usr/bin/entry_point.sh"]
