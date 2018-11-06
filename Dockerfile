FROM bobrik/curator

ADD curator.yml /.curator/curator.yml
ADD action.yml /action.yml

ENV DAYS 30
ENV ES_HOST elasticsearch

CMD ["action.yml"]
