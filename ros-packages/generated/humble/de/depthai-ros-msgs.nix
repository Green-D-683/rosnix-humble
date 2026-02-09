{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  sensor-msgs,
  std-msgs,
  substituteSource,
  vision-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "depthai_ros_msgs";
  version = "2.12.2-1";
  src = finalAttrs.passthru.sources."depthai_ros_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rclcpp ros-environment rosidl-default-generators sensor-msgs std-msgs vision-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rclcpp ros-environment rosidl-default-generators sensor-msgs std-msgs vision-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "depthai_ros_msgs" = substituteSource {
      src = fetchgit {
        name = "depthai_ros_msgs-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "a2f316a2a72a23ec99e8ff0275c13abf22799638";
        hash = "sha256-kVLGctDSM/J9pKZfDfXwiCY+zfjOKAF7zkQIBnavcPg=";
      };
    };
  });
  meta = {
    description = "Package to keep interface independent of the driver";
  };
})
