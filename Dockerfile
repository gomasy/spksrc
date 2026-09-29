FROM debian:trixie
LABEL description="Framework for maintaining and compiling native community packages for Synology devices"
LABEL maintainer="SynoCommunity <https://github.com/SynoCommunity/spksrc/graphs/contributors>"
LABEL url="https://synocommunity.com"
LABEL vcs-url="https://github.com/SynoCommunity/spksrc"

ENV LANG C.UTF-8

# Add backport channel (kept for later use, e.g. -t trixie-backports),
# install required packages (in sync with README.rst instructions) and clean up.
# All in a single layer so that apt lists/caches do not remain in the image.
RUN echo "deb http://deb.debian.org/debian trixie-backports main" > /etc/apt/sources.list.d/backports.list && \
	printf "Package: *\nPin: release a=trixie-backports\nPin-Priority: 100\n" > /etc/apt/preferences.d/99-backports && \
	apt-get update && \
	apt-get install --no-install-recommends -y \
	autoconf-archive \
	autogen \
	automake \
	autopoint \
	bash \
	bash-completion \
	bc \
	bison \
	build-essential \
	check \
	cmake \
	curl \
	cython3 \
	debootstrap \
	ed \
	expect \
	fakeroot \
	flex \
	gh \
	g++-multilib \
	gawk \
	gettext \
	gfortran \
	git \
	glslang-tools \
	gobject-introspection \
	gperf \
	imagemagick \
	intltool \
	jq \
	libbz2-dev \
	libc6-i386 \
	libcppunit-dev \
	libelf-dev \
	libffi-dev \
	libgc-dev \
	libgmp3-dev \
	libicu76 \
	libltdl-dev \
	libmount-dev \
	libncurses-dev \
	libpcre2-dev \
	libssl-dev \
	libtool \
	libtool-bin \
	libunistring-dev \
	lzip \
	man-db \
	manpages-dev \
	plocate \
	moreutils \
	nasm \
	p7zip \
	patchelf \
	php \
	pkg-config \
	rename \
	ripgrep \
	rsync \
	ruby-mustache \
	scons \
	spirv-tools \
	subversion \
	sudo \
	swig \
	texinfo \
	time \
	tree \
	unzip \
	xmlto \
	yasm \
	zip \
	zlib1g-dev \
	httpie \
	mercurial \
	meson \
	ninja-build \
	python3 \
	python3-jinja2 \
	python3-mako \
	python3-pip \
	python3-setuptools \
	python3-virtualenv \
	python3-yaml && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /var/cache/apt/* /var/log/apt/* /var/log/dpkg.log /tmp/* /var/tmp/* && \
	updatedb

# Add user
RUN adduser --disabled-password --gecos '' user && \
	adduser user sudo && \
	echo "%user ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/users

# Volume pointing to spksrc sources
VOLUME /spksrc
WORKDIR /spksrc
