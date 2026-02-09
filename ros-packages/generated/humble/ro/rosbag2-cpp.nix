{
  ament-cmake,
  ament-cmake-gmock,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rcpputils,
  rcutils,
  rmw,
  rmw-implementation,
  rmw-implementation-cmake,
  rosSystemPackages,
  rosbag2-storage,
  rosbag2-storage-default-plugins,
  rosbag2-storage-mcap,
  rosbag2-test-common,
  rosidl-runtime-c,
  rosidl-runtime-cpp,
  rosidl-typesupport-cpp,
  rosidl-typesupport-introspection-cpp,
  shared-queues-vendor,
  std-msgs,
  substituteSource,
  test-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_cpp";
  version = "0.15.16-1";
  src = finalAttrs.passthru.sources."rosbag2_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp pluginlib rclcpp rcpputils rcutils rmw rmw-implementation rosbag2-storage rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-cpp rosidl-typesupport-introspection-cpp shared-queues-vendor ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp pluginlib rclcpp rcpputils rcutils rmw rmw-implementation rosbag2-storage rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-cpp rosidl-typesupport-introspection-cpp shared-queues-vendor ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common rmw-implementation-cmake rosbag2-storage-default-plugins rosbag2-storage-mcap rosbag2-test-common std-msgs test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_cpp" = substituteSource {
      src = fetchgit {
        name = "rosbag2_cpp-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "e31d975a1b0d019e0f8a6c5cd48b91fd344923d5";
        hash = "sha256-d6GBX7P4geWQ7e7PH1bRXsIcT7gGvhLn+U3CmkyTABA=";
      };
    };
  });
  meta = {
    description = "C++ ROSBag2 client library";
  };
})
