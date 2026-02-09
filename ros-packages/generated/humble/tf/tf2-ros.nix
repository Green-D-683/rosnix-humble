{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  message-filters,
  mkSourceSet,
  rcl-interfaces,
  rclcpp,
  rclcpp-action,
  rclcpp-components,
  rosSystemPackages,
  rosgraph-msgs,
  substituteSource,
  tf2,
  tf2-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_ros";
  version = "0.25.18-1";
  src = finalAttrs.passthru.sources."tf2_ros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs message-filters rcl-interfaces rclcpp rclcpp-action rclcpp-components tf2 tf2-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs message-filters rcl-interfaces rclcpp rclcpp-action rclcpp-components tf2 tf2-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rosgraph-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_ros" = substituteSource {
      src = fetchgit {
        name = "tf2_ros-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "809aef7f5c1c3eb1b0d801104223af6ab440cb67";
        hash = "sha256-63D0NqAhASNHyCGDzLZnWlCkrQ/UEzZUhrey6isqJlU=";
      };
    };
  });
  meta = {
    description = "\n    This package contains the C++ ROS bindings for the tf2 library\n  ";
  };
})
