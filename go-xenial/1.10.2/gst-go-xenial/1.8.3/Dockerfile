FROM go-xenial:1.10.2

# gst-inspect-1.0 --version
# GStreamer 1.8.3

RUN apt-get update && \
    apt-get install -y libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tool libgstreamer-plugins-base1.0-dev build-essential

ENV CGO_CPPFLAGS="-I/usr/include/gstreamer-1.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/lib/x86_64-linux-gnu/gstreamer-1.0/include"
ENV CGO_LDFLAGS="-lgstreamer-1.0 -lglib-2.0 -lgobject-2.0 -lgstapp-1.0"
