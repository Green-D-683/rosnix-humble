{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-lint-common,
  autoware-motion-utils,
  autoware-planning-msgs,
  autoware-utils-geometry,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_planning_topic_converter";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_planning_topic_converter";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ autoware-motion-utils autoware-planning-msgs autoware-utils-geometry rclcpp rclcpp-components ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ autoware-motion-utils autoware-planning-msgs autoware-utils-geometry rclcpp rclcpp-components ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_planning_topic_converter" = substituteSource {
      src = fetchgit {
        name = "autoware_planning_topic_converter-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "416b4753d698de6d98714227fa2e1e11f9639e3d";
        hash = "sha256-uBkAO6htbydZqkIQbdVD0aO5RiBfrhcb5twQzBTu0p8=";
      };
    };
  });
  meta = {
    description = "The autoware_planning_topic_converter package";
  };
})
