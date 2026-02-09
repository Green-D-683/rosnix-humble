{
  ament-cmake,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  rosidl-default-generators,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kuka_drivers_core";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."kuka_drivers_core";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ controller-manager lifecycle-msgs rclcpp rclcpp-lifecycle ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ controller-manager lifecycle-msgs rclcpp rclcpp-lifecycle ];
  passthru.sources = mkSourceSet (sources: {
    "kuka_drivers_core" = substituteSource {
      src = fetchgit {
        name = "kuka_drivers_core-source";
        url = "https://github.com/ros2-gbp/kuka_drivers-release.git";
        rev = "d31c0e560a31ca36c1cfa1fb6f95681c17a8429e";
        hash = "sha256-vgrSEx4nwCDXUXp9w0QAv9uZqEmaE1O9VNK0fq/coYw=";
      };
    };
  });
  meta = {
    description = "Package containing ROS2 core functions for KUKA robots";
  };
})
