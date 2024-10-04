#!/bin/bash
_git_download() {
    git submodule update --init -- wine
    git submodule update --init -- wine-staging
    _winesrctarget="https://github.com/wine-mirror/wine.git"
    _stgsrctarget="https://github.com/wine-staging/wine-staging.git"

    # Wine staging checkout
    cd wine-staging || exit 1
    _repo="$(git config --get remote.origin.url)"
    if [[ "${_stgsrctarget}" != "$_repo" ]]; then
      echo "Did not end up in the right repository, we got $_repo"
      exit 1
    fi

    # Wine checkout
    cd ../wine || exit 1
    _repo="$(git config --get remote.origin.url)"
    if [[ "${_winesrctarget}" != "$_repo" ]]; then
      echo "Did not end up in the right repository, we got $_repo"
      exit 1
    fi
}

_prepare()
{
    python3 ../wine-staging/staging/patchinstall.py --all
    sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i configure*
    # configure more here
}

_build()
{
    wine64="--with-wine64=../wine64"
    mkdir wine64
    cd wine64 || exit 1

    CFLAGS="-O2 -fPIC" \
    CXXFLAGS="-O2 -fPIC" \
    LDFLAGS="-L/usr/lib64 -ldl" \
    ../configure \
        --prefix=/usr \
        --libdir=/usr/lib64 \
        --localstatedir=/var \
        --sysconfdir=/etc \
        --mandir=/usr/man \
        --enable-win64 \
        --enable-archs="i386,x86_64" \
        --with-x \
        --with-gnutls \
        --with-opengl \
        --program-prefix= \
        --program-suffix= \
        --build="x86_64"
    make
    cd ..
    mkdir wine32
    cd wine32 || exit 1
    export PKG_CONFIG_PATH="/usr/lib/pkgconfig:$PKG_CONFIG_PATH"

    CFLAGS="-O2 -fPIC" \
    CXXFLAGS="-O2 -fPIC" \
    LDFLAGS="-L/usr/lib -ldl" \
    ../configure \
        $wine64 \
        --prefix=/usr \
        --libdir=/usr/lib \
        --localstatedir=/var \
        --sysconfdir=/etc \
        --mandir=/usr/man \
        --with-x \
        --with-gnutls \
        --with-opengl \
        --program-prefix= \
        --program-suffix= \
        --build="x86_64"
    make
}

_git_download
_prepare
_build

