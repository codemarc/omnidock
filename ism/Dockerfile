FROM cibi/base
MAINTAINER Marc J. Greenberg <marc_greenberg@ibi.com>

COPY cloud.sh /

EXPOSE 9999
EXPOSE 9000
EXPOSE 9001
EXPOSE 8999
EXPOSE 6199
EXPOSE 9280

VOLUME ["/omni/ids"]

CMD "./cloud.sh"