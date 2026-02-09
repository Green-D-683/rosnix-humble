{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  can-msgs,
  dataspeed-can-msg-filters,
  dataspeed-can-usb,
  dataspeed-dbw-common,
  dataspeed-ulc-can,
  dbw-polaris-description,
  dbw-polaris-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dbw_polaris_can";
  version = "2.1.16-1";
  src = finalAttrs.passthru.sources."dbw_polaris_can";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ can-msgs dataspeed-can-msg-filters dataspeed-can-usb dataspeed-dbw-common dataspeed-ulc-can dbw-polaris-description dbw-polaris-msgs geometry-msgs rclcpp rclcpp-components sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ can-msgs dataspeed-can-msg-filters dataspeed-can-usb dataspeed-dbw-common dataspeed-ulc-can dbw-polaris-description dbw-polaris-msgs geometry-msgs rclcpp rclcpp-components sensor-msgs std-msgs ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "dbw_polaris_can" = substituteSource {
      src = fetchgit {
        name = "dbw_polaris_can-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "04ee053010e0339edf1ad9d46497ba046097bc9c";
        hash = "sha256-Ai6XqQv0d4IiPNJyw1FoqLmDWDGCF3HfgrzHXI/kGOQ=";
      };
    };
  });
  meta = {
    description = "\n    Drive-by-wire interface to the Dataspeed Inc. Polaris GEM/Ranger/RZR DBW kit\n  ";
  };
})
