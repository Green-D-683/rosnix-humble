{
  ament-cmake,
  ament-cmake-auto,
  asio-cmake-module,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  io-context,
  mkSourceSet,
  nav-msgs,
  pluginlib,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  serial-driver,
  std-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "robotont_driver";
  version = "0.1.4-1";
  src = finalAttrs.passthru.sources."robotont_driver";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto asio-cmake-module ];
  propagatedNativeBuildInputs = [ geometry-msgs io-context nav-msgs pluginlib rclcpp rclcpp-components rclcpp-lifecycle serial-driver std-msgs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "asio" ]; };
  buildInputs = [ ament-cmake ament-cmake-auto asio-cmake-module ];
  propagatedBuildInputs = [ geometry-msgs io-context nav-msgs pluginlib rclcpp rclcpp-components rclcpp-lifecycle serial-driver std-msgs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "asio" ]; };
  passthru.sources = mkSourceSet (sources: {
    "robotont_driver" = substituteSource {
      src = fetchgit {
        name = "robotont_driver-source";
        url = "https://github.com/ros2-gbp/robotont_driver-release.git";
        rev = "54ea48dbc7551170e79e515e2b7a98066a013cbd";
        hash = "sha256-NRqqIL+cQql2vfYFYRca9U06zHQBczT7oY8O1lq2ZSs=";
      };
    };
  });
  meta = {
    description = "Hardware driver for the Robotont robot";
  };
})
