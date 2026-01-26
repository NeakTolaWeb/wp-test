FROM wordpress:latest

# Install dependencies to build and enable memcached PHP extension
RUN set -ex \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        libmemcached-dev zlib1g-dev pkg-config libssl-dev build-essential \
        php-pear \
    && pecl install memcached \
    && docker-php-ext-enable memcached \
    && rm -rf /var/lib/apt/lists/*

# Keep default entrypoint/command from the official wordpress image
