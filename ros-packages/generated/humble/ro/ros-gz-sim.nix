{
  ament-cmake,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  ros2pkg,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_gz_sim";
  version = "0.244.21-1";
  src = finalAttrs.passthru.sources."ros_gz_sim";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ ament-index-python rclcpp ros2pkg std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "ignition-gazebo6" "ignition-math6" "libgflags-dev" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ ament-index-python rclcpp ros2pkg std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ignition-gazebo6" "ignition-math6" "libgflags-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros_gz_sim" = substituteSource {
      src = fetchgit {
        name = "ros_gz_sim-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "3366a8969e51d30b2804c95a6ee0bf14528002e2";
        hash = "sha256-/Rn/h3YHR/kNWc8Q6d3yDUZ8c9RPPQtqzwp7ugezjPo=";
      };
    };
  });
  meta = {
    description = "Tools for using Gazebo Sim simulation with ROS.";
  };
})
