FROM omnidb
MAINTAINER Marc J. Greenberg <marc_greenberg@ibi.com>

ENV LANG en_US.utf8
ENV PG_MAJOR 9.4
ENV PG_VERSION 9.4.1-1.pgdg70+1
ENV PATH /usr/lib/postgresql/$PG_MAJOR/bin:$PATH
ENV PGDATA /var/lib/postgresql/data

VOLUME /var/lib/postgresql/data

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]