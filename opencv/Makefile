

# http://docs.opencv.org/master/d7/d9f/tutorial_linux_install.html#gsc.tab=0
#
#
# run apt-get-packages target to achieve this:
  # 1 [compiler] sudo apt-get install build-essential
  #   2 [required] sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
  #   3 [optional] sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
#
#

.PHONY: sync
sync: sync-opencv sync-opencv_contrib sync-opencv_extra


sync-opencv sync-opencv_contrib sync-opencv_extra: sync-%:
	if [ -d "$*" ]; then \ 
		git clone https://github.com/Itseez/$*.git; \
	else \
		cd $* && git pull; \
	fi

#CMAKE_ARGS += -D CMAKE_BUILD_TYPE=Release
CMAKE_ARGS += -D CMAKE_BUILD_TYPE=Debug
CMAKE_ARGS += -D CMAKE_INSTALL_PREFIX=../install
CMAKE_ARGS += -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules
CMAKE_ARGS += -D BUILD_DOCS=1
CMAKE_ARGS += -D BUILD_EXAMPLES=1


.PHONY: configure
configure:
	mkdir -p build
	mkdir -p install
	cd build && cmake $(CMAKE_ARGS) ../opencv

.PHONY: build
build:
	$(MAKE) -C build -j7

.PHONY: install
install: build
	$(MAKE) -C build install

.PHONY: test
test:
	 OPENCV_TEST_DATA_PATH=opencv_extra/testdata ./build/bin/opencv_test_core


##################################
.PHONY: apt-get-packages
apt-get-packages:
	apt-get install build-essential
	apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
	apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
##################################

