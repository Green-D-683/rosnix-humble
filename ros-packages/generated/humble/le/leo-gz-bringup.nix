{
  ament-cmake,
  ament-cmake-black,
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-cmake-mypy,
  ament-cmake-xmllint,
  ament-index-python,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo-description,
  leo-gz-plugins,
  leo-gz-worlds,
  mkSourceSet,
  robot-state-publisher,
  ros-gz-bridge,
  ros-gz-image,
  ros-gz-sim,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_gz_bringup";
  version = "1.1.2-1";
  src = finalAttrs.passthru.sources."leo_gz_bringup";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-python leo-description leo-gz-plugins leo-gz-worlds robot-state-publisher ros-gz-bridge ros-gz-image ros-gz-sim xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-python leo-description leo-gz-plugins leo-gz-worlds robot-state-publisher ros-gz-bridge ros-gz-image ros-gz-sim xacro ];
  checkInputs = [ ament-cmake-black ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-mypy ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_gz_bringup" = substituteSource {
      src = fetchgit {
        name = "leo_gz_bringup-source";
        url = "https://github.com/ros2-gbp/leo_simulator-release.git";
        rev = "4a440bf90366ab23c1d6a0df3838c2ba730c77ec";
        hash = "sha256-vVZlcK8kkWRwT1VAdjPSnJoOOGNbLQbhdkz4cNvp3Og=";
      };
    };
  });
  meta = {
    description = "Bringup package for Leo Rover Gazebo simulation in ROS 2";
  };
})
