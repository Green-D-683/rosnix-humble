{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-index-cpp,
  autoware-cmake,
  autoware-lanelet2-extension,
  autoware-pyplot,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_lanelet2_utils";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_lanelet2_utils";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-lanelet2-extension rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "range-v3" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-lanelet2-extension rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "range-v3" ]; };
  checkInputs = [ ament-cmake-ros ament-index-cpp autoware-pyplot ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_lanelet2_utils" = substituteSource {
      src = fetchgit {
        name = "autoware_lanelet2_utils-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "bf32584408c6dd212c8d5158e002790e5bd3b0c0";
        hash = "sha256-J/n6wBS+mzz3CkgrXvaUpY1HO6sii3ulWrYtFRq1JG0=";
      };
    };
  });
  meta = {
    description = "The autoware_lanelet2_utils package";
  };
})
