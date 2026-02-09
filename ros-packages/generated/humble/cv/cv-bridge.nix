{
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-ros,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-cmake-module,
  rcpputils,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cv_bridge";
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."cv_bridge";
  nativeBuildInputs = [ ament-cmake-ros python-cmake-module ];
  propagatedNativeBuildInputs = [ ament-index-python rcpputils sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-dev" "libboost-python" "libboost-python-dev" "libopencv-dev" "python3-numpy" "python3-opencv" ]; };
  buildInputs = [ ament-cmake-ros python-cmake-module ];
  propagatedBuildInputs = [ ament-index-python rcpputils sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" "libboost-python" "libboost-python-dev" "libopencv-dev" "python3-numpy" "python3-opencv" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cv_bridge" = substituteSource {
      src = fetchgit {
        name = "cv_bridge-source";
        url = "https://github.com/ros2-gbp/vision_opencv-release.git";
        rev = "60cdf474334fe326efc60de14b0f150ec4844b97";
        hash = "sha256-hrhmEchLEAyY7EsU0zS2npW3tH7c0nkIHp6Wds1WbyM=";
      };
    };
  });
  meta = {
    description = "\n    This contains CvBridge, which converts between ROS2\n    Image messages and OpenCV images.\n  ";
  };
})
