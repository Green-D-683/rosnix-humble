{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-lint-common,
  autoware-perception-msgs,
  autoware-utils-geometry,
  autoware-utils-math,
  autoware-utils-visualization,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_objects_of_interest_marker_interface";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_objects_of_interest_marker_interface";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ autoware-perception-msgs autoware-utils-geometry autoware-utils-math autoware-utils-visualization geometry-msgs rclcpp std-msgs visualization-msgs ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ autoware-perception-msgs autoware-utils-geometry autoware-utils-math autoware-utils-visualization geometry-msgs rclcpp std-msgs visualization-msgs ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_objects_of_interest_marker_interface" = substituteSource {
      src = fetchgit {
        name = "autoware_objects_of_interest_marker_interface-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "5178450e97cac75a3d8b65317c35d138e4de08c4";
        hash = "sha256-O1jRHBvQdxHbThVD0P/jjN+/zo+h40qgvF+DeIc5S3w=";
      };
    };
  });
  meta = {
    description = "The autoware_objects_of_interest_marker_interface package";
  };
})
