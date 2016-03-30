FROM debian:latest

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y postfix python python-pip

RUN pip install m3u8 PyYAML

COPY . /hlsprobe
WORKDIR /hlsprobe

ENV STREAMS_URL="http://127.0.0.1:8080/hls/live.stream" \
    WORKERS_STREAM_PROBERS="32" \
    WORKERS_MEDIA_PROBERS="32" \
    NOTIFY_REPORT_THRESHOLD="1" \
    NOTIFY_ADDRESSES="example@example.com" \
    NOTIFY_AUTHOR="hlsprobe@example.com" \
    SLEEP_PLAYLIST_OPEN="0" \
    SLEEP_STREAM_LIST="0.01" \
    TIMEOUT_TARGET_DURATION="30" \
    TIMEOUT_READ="30" \
    TIMEOUT_KEEP_ERROR="30" \
    TIMEOUT_SPAM="120" \
    MODE_ONE_SEGMENT="true" 

CMD ["./run.sh"]
