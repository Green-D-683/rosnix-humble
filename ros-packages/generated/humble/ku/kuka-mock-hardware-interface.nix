{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  mkSourceSet,
  pluginlib,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kuka_mock_hardware_interface";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."kuka_mock_hardware_interface";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ hardware-interface pluginlib ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ hardware-interface pluginlib ];
  passthru.sources = mkSourceSet (sources: {
    "kuka_mock_hardware_interface" = substituteSource {
      src = fetchgit {
        name = "kuka_mock_hardware_interface-source";
        url = "https://github.com/ros2-gbp/kuka_robot_descriptions-release.git";
        rev = "c8bce56f074950b385c2ab5994f3498bcdf3a83a";
        hash = "sha256-oxaJN/uUNemyemwHWNv6rgkRIiXmVISLAe3ePsWwmd0=";
      };
    };
  });
  meta = {
    description = "ROS2 control mock hardware for KUKA robots";
  };
})
