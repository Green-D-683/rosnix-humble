{
  ament-cmake-ros,
  buildAmentCmakePackage,
  controller-interface,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  realtime-tools,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "picknik_reset_fault_controller";
  version = "0.0.3-1";
  src = finalAttrs.passthru.sources."picknik_reset_fault_controller";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ controller-interface example-interfaces geometry-msgs rclcpp realtime-tools ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ controller-interface example-interfaces geometry-msgs rclcpp realtime-tools ];
  passthru.sources = mkSourceSet (sources: {
    "picknik_reset_fault_controller" = substituteSource {
      src = fetchgit {
        name = "picknik_reset_fault_controller-source";
        url = "https://github.com/ros2-gbp/picknik_controllers-release.git";
        rev = "50e8d59d0e9e6c44c8c4ed10a1e8d01340ce55c0";
        hash = "sha256-1YeT/ItbimfyeiruRaU6K0IcXsIuJworLhzpN4VczDs=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 controller that offers a service to clear faults in a hardware interface\n  ";
  };
})
