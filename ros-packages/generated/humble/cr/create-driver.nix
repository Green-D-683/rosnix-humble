{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  create-msgs,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  libcreate,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "create_driver";
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."create_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ create-msgs diagnostic-msgs diagnostic-updater geometry-msgs libcreate nav-msgs rclcpp sensor-msgs std-msgs tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ create-msgs diagnostic-msgs diagnostic-updater geometry-msgs libcreate nav-msgs rclcpp sensor-msgs std-msgs tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "create_driver" = substituteSource {
      src = fetchgit {
        name = "create_driver-source";
        url = "https://github.com/AutonomyLab/create_autonomy-release.git";
        rev = "a81cd010f673172c88e7cc76d5d4643d9e9919e9";
        hash = "sha256-MtmP441wu0T5gtTDWlUotICJL0MbA0MvOMuBMViUxdQ=";
      };
    };
  });
  meta = {
    description = "ROS driver for iRobot's Create and Roomba platforms, based on libcreate";
  };
})
