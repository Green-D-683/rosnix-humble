{
  ament-cmake,
  ament-cmake-gmock,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  kdl-parser,
  kinematics-interface,
  mkSourceSet,
  pluginlib,
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
  tf2-eigen-kdl,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kinematics_interface_kdl";
  version = "0.4.1-1";
  src = finalAttrs.passthru.sources."kinematics_interface_kdl";
  nativeBuildInputs = [ ament-cmake eigen3-cmake-module ];
  propagatedNativeBuildInputs = [ kdl-parser kinematics-interface pluginlib tf2-eigen-kdl ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake eigen3-cmake-module ];
  propagatedBuildInputs = [ kdl-parser kinematics-interface pluginlib tf2-eigen-kdl ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gmock ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "kinematics_interface_kdl" = substituteSource {
      src = fetchgit {
        name = "kinematics_interface_kdl-source";
        url = "https://github.com/ros2-gbp/kinematics_interface-release.git";
        rev = "e336974d8df71577e93b53eb34d03a5aed5b3b30";
        hash = "sha256-bLt6nQaiwMpZfDwXv21okJRfVlekof/MXEboIPY2spE=";
      };
    };
  });
  meta = {
    description = "KDL implementation of ros2_control kinematics interface";
  };
})
