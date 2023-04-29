FROM ghcr.io/goauthentik/server:2023.4.1

EXPOSE 9000
EXPOSE 9443


ENV TMPDIR /dev/shm/
ENV PYTHONUNBUFFERED 1
ENV PATH "/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/lifecycle"

HEALTHCHECK --interval=30s --timeout=30s --start-period=60s --retries=3 CMD [ "/lifecycle/ak", "healthcheck" ]

ENTRYPOINT [ "/usr/local/bin/dumb-init", "--", "/lifecycle/ak" ]
