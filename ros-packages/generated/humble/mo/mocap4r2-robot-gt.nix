{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  mocap4r2-msgs,
  mocap4r2-robot-gt-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mocap4r2_robot_gt";
  version = "0.0.7-1";
  src = finalAttrs.passthru.sources."mocap4r2_robot_gt";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs mocap4r2-msgs mocap4r2-robot-gt-msgs rclcpp rclcpp-components tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs mocap4r2-msgs mocap4r2-robot-gt-msgs rclcpp rclcpp-components tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mocap4r2_robot_gt" = substituteSource {
      src = fetchgit {
        name = "mocap4r2_robot_gt-source";
        url = "https://github.com/MOCAP4ROS2-Project/mocap4r2-release.git";
        rev = "853ea5aaed973f159a550229010e271f48d6b04b";
        hash = "sha256-cv35GYqUQm8IV5yGNdZczIfb/p0nT56i6lDXezRyhJE=";
      };
    };
  });
  meta = {
    description = "Package that provides Ground Truth tools for robots";
  };
})
