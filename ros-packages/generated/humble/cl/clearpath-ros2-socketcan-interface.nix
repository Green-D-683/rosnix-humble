{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  can-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_ros2_socketcan_interface";
  version = "1.0.4-1";
  src = finalAttrs.passthru.sources."clearpath_ros2_socketcan_interface";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ can-msgs rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "iproute2" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ can-msgs rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "iproute2" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_ros2_socketcan_interface" = substituteSource {
      src = fetchgit {
        name = "clearpath_ros2_socketcan_interface-source";
        url = "https://github.com/clearpath-gbp/clearpath_ros2_socketcan_interface-release.git";
        rev = "4b5154cff5f57441a0847dd2343007d537a1859d";
        hash = "sha256-SB2ybEWTC1Kr0STklqD7Qx5KkiyRKXziTtU3R264/48=";
      };
    };
  });
  meta = {
    description = "A ROS 2 socketcan interface.";
  };
})
