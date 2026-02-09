{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-index-cpp,
  autoware-cmake,
  autoware-lanelet2-extension,
  autoware-perception-msgs,
  autoware-planning-msgs,
  autoware-utils-geometry,
  autoware-utils-visualization,
  autoware-vehicle-info-utils,
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
  pname = "autoware_marker_utils";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_marker_utils";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-lanelet2-extension autoware-perception-msgs autoware-planning-msgs autoware-utils-geometry autoware-utils-visualization autoware-vehicle-info-utils rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "range-v3" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-lanelet2-extension autoware-perception-msgs autoware-planning-msgs autoware-utils-geometry autoware-utils-visualization autoware-vehicle-info-utils rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "range-v3" ]; };
  checkInputs = [ ament-cmake-ros ament-index-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_marker_utils" = substituteSource {
      src = fetchgit {
        name = "autoware_marker_utils-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "260c1b66c4ccdc7e1f8df7b518f616bf64d0ef16";
        hash = "sha256-AUSQVFzJTRhIxvy+SvseOpsThzP45Avb2U/FYkeXGak=";
      };
    };
  });
  meta = {
    description = "The autoware_marker_utils package";
  };
})
