{
  ament-cmake,
  buildAmentCmakePackage,
  controller-interface,
  fetchgit,
  fetchurl,
  fetchzip,
  kuka-drivers-core,
  mkSourceSet,
  pluginlib,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kuka_control_mode_handler";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."kuka_control_mode_handler";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ controller-interface kuka-drivers-core pluginlib ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-interface kuka-drivers-core pluginlib ];
  passthru.sources = mkSourceSet (sources: {
    "kuka_control_mode_handler" = substituteSource {
      src = fetchgit {
        name = "kuka_control_mode_handler-source";
        url = "https://github.com/ros2-gbp/kuka_drivers-release.git";
        rev = "ed2c7f6088c259b253c508ebfb7cc42a2957e1b1";
        hash = "sha256-5S10NiAH2kKBcldnQ8itYTpmliON58e6y4VT+hbawbs=";
      };
    };
  });
  meta = {
    description = "Controller for setting the control mode of KUKA robots in runtime";
  };
})
