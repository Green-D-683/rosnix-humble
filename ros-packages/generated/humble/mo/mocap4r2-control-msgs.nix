{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rosidl-default-generators,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mocap4r2_control_msgs";
  version = "0.0.7-1";
  src = finalAttrs.passthru.sources."mocap4r2_control_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rclcpp rosidl-default-generators std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rclcpp rosidl-default-generators std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mocap4r2_control_msgs" = substituteSource {
      src = fetchgit {
        name = "mocap4r2_control_msgs-source";
        url = "https://github.com/MOCAP4ROS2-Project/mocap4r2-release.git";
        rev = "1a797134189cd88a129af503e84800310c97eb6c";
        hash = "sha256-+FLvovbIKRhEjyb4Xaisl8yVR3E7uab+ONsUZT+T/p4=";
      };
    };
  });
  meta = {
    description = "mocap4r2_control_msgs";
  };
})
