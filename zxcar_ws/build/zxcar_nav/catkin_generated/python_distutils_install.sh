#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/zxcar/zxcar_ws/src/zxcar_nav"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/zxcar/zxcar_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/zxcar/zxcar_ws/install/lib/python2.7/dist-packages:/home/zxcar/zxcar_ws/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/zxcar/zxcar_ws/build" \
    "/usr/bin/python2" \
    "/home/zxcar/zxcar_ws/src/zxcar_nav/setup.py" \
     \
    build --build-base "/home/zxcar/zxcar_ws/build/zxcar_nav" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/zxcar/zxcar_ws/install" --install-scripts="/home/zxcar/zxcar_ws/install/bin"
