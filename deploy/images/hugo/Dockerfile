FROM debian:jessie

ENV HUGO_VERSION 0.105.0
ENV HUGO_BINARY hugo_${HUGO_VERSION}_linux-amd64.deb

# Install pygments (for syntax highlighting) 
RUN apt-get -qq update \
	&& DEBIAN_FRONTEND=noninteractive apt-get -qq install -y --no-install-recommends python-pygments git ca-certificates asciidoc \
	&& rm -rf /var/lib/apt/lists/*

# Download and install hugo
ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} /tmp/hugo.deb
RUN dpkg -i /tmp/hugo.deb \
	&& rm /tmp/hugo.deb

# Create working directory
RUN mkdir -p /workspace
WORKDIR /workspace

# Expose default hugo port
EXPOSE 1313
ENTRYPOINT ["/usr/local/bin/hugo"]
