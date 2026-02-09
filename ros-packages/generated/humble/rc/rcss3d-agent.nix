{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rcss3d-agent-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcss3d_agent";
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."rcss3d_agent";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rclcpp rcss3d-agent-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rclcpp rcss3d-agent-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rcss3d_agent" = substituteSource {
      src = fetchgit {
        name = "rcss3d_agent-source";
        url = "https://github.com/ros2-gbp/rcss3d_agent-release.git";
        rev = "8cdfd925ac37a95d8ad28ccb7f91f023adc7cc92";
        hash = "sha256-20VvRemKR1Wv/aezwF9TAU3NH/pYY1sABOAOXXO1ggE=";
      };
    };
  });
  meta = {
    description = "Launches a RoboCup 3D Simulation Agent, and converts data to and from ROS2 msgs";
  };
})
