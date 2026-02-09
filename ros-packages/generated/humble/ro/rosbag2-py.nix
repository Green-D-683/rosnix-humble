{
  ament-cmake-python,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pybind11-vendor,
  python-cmake-module,
  rcl-interfaces,
  rclpy,
  rosSystemPackages,
  rosbag2-compression,
  rosbag2-cpp,
  rosbag2-storage,
  rosbag2-storage-default-plugins,
  rosbag2-transport,
  rosidl-runtime-py,
  rpyutils,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_py";
  version = "0.15.16-1";
  src = finalAttrs.passthru.sources."rosbag2_py";
  nativeBuildInputs = [ ament-cmake-python ament-cmake-ros python-cmake-module ];
  propagatedNativeBuildInputs = [ pybind11-vendor rosbag2-compression rosbag2-cpp rosbag2-storage rosbag2-transport rpyutils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" ]; };
  buildInputs = [ ament-cmake-python ament-cmake-ros python-cmake-module ];
  propagatedBuildInputs = [ pybind11-vendor rosbag2-compression rosbag2-cpp rosbag2-storage rosbag2-transport rpyutils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common rcl-interfaces rclpy rosbag2-storage-default-plugins rosidl-runtime-py std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_py" = substituteSource {
      src = fetchgit {
        name = "rosbag2_py-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "2d600977a063865fa9259a451520d95e33ac5e2b";
        hash = "sha256-jVPZ3d9CBr3GJQ8XeLSTzhxTO6MWvibdvOz0N+OSPXc=";
      };
    };
  });
  meta = {
    description = "Python API for rosbag2";
  };
})
