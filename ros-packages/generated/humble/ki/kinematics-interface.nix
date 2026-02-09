{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kinematics_interface";
  version = "0.4.1-1";
  src = finalAttrs.passthru.sources."kinematics_interface";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp-lifecycle ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp-lifecycle ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "kinematics_interface" = substituteSource {
      src = fetchgit {
        name = "kinematics_interface-source";
        url = "https://github.com/ros2-gbp/kinematics_interface-release.git";
        rev = "41675a1e932d5c83f675515affb34e397e9c350e";
        hash = "sha256-/tO0qtIdgMYao4n7n4Z4rql44SgmqnOvCWx7i578TiI=";
      };
    };
  });
  meta = {
    description = "Kinematics interface for ROS 2 control";
  };
})
