# HLS Probe Utility

Utility to detect errors in HTTP Live Streams (Apple HLS).
It may be used regular monitoring tool and mediaserver stress testing.
Features are:

 * parse M3U8-playlists (variant and single-bitrate playlists supported)
 * detect bad playlists format (empty playlists, incorrect chunk durations)
 * check HTTP response statuses and webserver timeouts

## Docker instructions

```sh
docker run -it \
  -e STREAMS_URL=http://127.0.0.1:8080/hls/live.stream \
  -e WORKERS_STREAM_PROBERS=32 \
  -e WORKERS_MEDIA_PROBERS=32 \
  -e NOTIFY_REPORT_THRESHOLD=1 \
  -e NOTIFY_ADDRESSES=example@example.com \
  -e NOTIFY_AUTHOR=hlsprobe@example.com \
  -e SLEEP_PLAYLIST_OPEN=0 \
  -e SLEEP_STREAM_LIST=0.01 \
  -e TIMEOUT_TARGET_DURATION=30 \
  -e TIMEOUT_READ=30 \
  -e TIMEOUT_KEEP_ERROR=30 \
  -e TIMEOUT_SPAM=120 \
  -e MODE_ONE_SEGMENT=true \
     datarhei/hlsprobe
```

## Authors

[Alexander I.Grafov](https://github.com/grafov), fork of [Ari Aosved](https://github.com/devaos)
