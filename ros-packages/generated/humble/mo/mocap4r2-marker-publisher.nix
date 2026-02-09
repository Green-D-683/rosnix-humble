{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mocap4r2-msgs,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mocap4r2_marker_publisher";
  version = "0.0.7-1";
  src = finalAttrs.passthru.sources."mocap4r2_marker_publisher";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ mocap4r2-msgs rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ mocap4r2-msgs rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mocap4r2_marker_publisher" = substituteSource {
      src = fetchgit {
        name = "mocap4r2_marker_publisher-source";
        url = "https://github.com/MOCAP4ROS2-Project/mocap4r2-release.git";
        rev = "4a00cbdea7206cadecd0bfdbe5c735e2458dd649";
        hash = "sha256-e2j4pswLnfH7hrhIK2VE6EWKvJw37YSlGyXZfKBxvfg=";
      };
    };
  });
  meta = {
    description = "Node for publishing some simple marker data for testing purposes";
  };
})
