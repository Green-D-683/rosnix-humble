{
  ament-cmake,
  ament-index-cpp,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  std-srvs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlesim";
  version = "1.4.3-1";
  src = finalAttrs.passthru.sources."turtlesim";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-cpp geometry-msgs rclcpp rclcpp-action rosidl-default-runtime std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqt5-core" "libqt5-gui" "qt5-qmake" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ ament-index-cpp geometry-msgs rclcpp rclcpp-action rosidl-default-runtime std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "qt5-qmake" "qtbase5-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "turtlesim" = substituteSource {
      src = fetchgit {
        name = "turtlesim-source";
        url = "https://github.com/ros2-gbp/ros_tutorials-release.git";
        rev = "4c3d6c6770bd3a7cbb787c0a31365fbe05295350";
        hash = "sha256-F0XP5YZeA6nNiLVziK5K0ljMvxosBnkrx1bbfyR9v3w=";
      };
    };
  });
  meta = {
    description = "\n    turtlesim is a tool made for teaching ROS and ROS packages.\n  ";
  };
})
