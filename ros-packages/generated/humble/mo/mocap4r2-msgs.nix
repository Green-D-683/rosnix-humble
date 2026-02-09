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
  pname = "mocap4r2_msgs";
  version = "0.0.6-2";
  src = finalAttrs.passthru.sources."mocap4r2_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rclcpp rosidl-default-generators std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rclcpp rosidl-default-generators std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mocap4r2_msgs" = substituteSource {
      src = fetchgit {
        name = "mocap4r2_msgs-source";
        url = "https://github.com/MOCAP4ROS2-Project/mocap4r2_msgs-release.git";
        rev = "7343391c7233a5d16978816e91167a307d262b21";
        hash = "sha256-MBWVqIPhtktrcZxtbHYRX9MdD1zMtPcoh1ncfa+kFMg=";
      };
    };
  });
  meta = {
    description = "Interfaces for Mocap4ROS2 project";
  };
})
