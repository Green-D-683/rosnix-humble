{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-internal-planning-msgs,
  autoware-lint-common,
  autoware-motion-utils,
  autoware-planning-msgs,
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
  pname = "autoware_planning_factor_interface";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_planning_factor_interface";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-internal-planning-msgs autoware-motion-utils autoware-planning-msgs rclcpp ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-internal-planning-msgs autoware-motion-utils autoware-planning-msgs rclcpp ];
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_planning_factor_interface" = substituteSource {
      src = fetchgit {
        name = "autoware_planning_factor_interface-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "849299453d3c04066140bfb672d20151c8d8c8ba";
        hash = "sha256-w6vJJ1WwohhTzM6towpzSTPApUrorv79ecBYD8WB0eA=";
      };
    };
  });
  meta = {
    description = "The autoware_planning_factor_interface package";
  };
})
