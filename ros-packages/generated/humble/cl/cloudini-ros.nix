{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cloudini-lib,
  fetchgit,
  fetchurl,
  fetchzip,
  mcap-vendor,
  mkSourceSet,
  pcl-conversions,
  pcl-ros,
  pluginlib,
  point-cloud-interfaces,
  point-cloud-transport,
  rclcpp,
  rosSystemPackages,
  rosbag2-cpp,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cloudini_ros";
  version = "0.11.1-2";
  src = finalAttrs.passthru.sources."cloudini_ros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cloudini-lib mcap-vendor pcl-conversions pcl-ros pluginlib point-cloud-interfaces point-cloud-transport rclcpp rosbag2-cpp sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cloudini-lib mcap-vendor pcl-conversions pcl-ros pluginlib point-cloud-interfaces point-cloud-transport rclcpp rosbag2-cpp sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cloudini_ros" = substituteSource {
      src = fetchgit {
        name = "cloudini_ros-source";
        url = "https://github.com/facontidavide/cloudini-release.git";
        rev = "ff6d846236aed0914a06384a1b3df2e16dbcaa97";
        hash = "sha256-rvNp0tMKIWWxYEt6T9Xk9j/vNUtKZ1ijZ11X+mbM09Q=";
      };
    };
  });
  meta = {
    description = "\n  Main library of Cloudini, the pointcloud compression library\n  ";
  };
})
