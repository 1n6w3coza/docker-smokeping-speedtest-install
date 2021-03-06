FROM linuxserver/smokeping:latest as release

# Copy in default speedtest probe/target config
COPY config / /speedtest-conf/

# Install speedtest-cli and it's dependencies
RUN apk add python3 --no-cache \
    && (cd /usr/bin && ln -s python3.8 python) \
    && curl -L -s -S -o /usr/share/perl5/vendor_perl/Smokeping/probes/speedtest.pm https://raw.githubusercontent.com/mad-ady/smokeping-speedtest/master/speedtest.pm \
    && curl -L -s -S -o /usr/local/bin/speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py \
    && chmod a+x /usr/local/bin/speedtest-cli \
    && cat /speedtest-conf/Probes > /defaults/smoke-conf/Probes \
    && cat /speedtest-conf/Targets > /defaults/smoke-conf/Targets
