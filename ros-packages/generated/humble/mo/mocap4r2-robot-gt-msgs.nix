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
  pname = "mocap4r2_robot_gt_msgs";
  version = "0.0.7-1";
  src = finalAttrs.passthru.sources."mocap4r2_robot_gt_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rclcpp rosidl-default-generators std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rclcpp rosidl-default-generators std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mocap4r2_robot_gt_msgs" = substituteSource {
      src = fetchgit {
        name = "mocap4r2_robot_gt_msgs-source";
        url = "https://github.com/MOCAP4ROS2-Project/mocap4r2-release.git";
        rev = "182e59edd487d177a9cbe24dcd882825b574eddf";
        hash = "sha256-WSc+07t2eKfnv4FnLP3fPtTwMJTEXXyvaPLrHLE/g0I=";
      };
    };
  });
  meta = {
    description = "mocap4r2_robot_gt_msgs";
  };
})
