{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  can-msgs,
  dataspeed-can-msg-filters,
  dataspeed-can-usb,
  dataspeed-dbw-common,
  dataspeed-ulc-can,
  dbw-fca-description,
  dbw-fca-msgs,
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
  pname = "dbw_fca_can";
  version = "2.1.16-1";
  src = finalAttrs.passthru.sources."dbw_fca_can";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ can-msgs dataspeed-can-msg-filters dataspeed-can-usb dataspeed-dbw-common dataspeed-ulc-can dbw-fca-description dbw-fca-msgs geometry-msgs rclcpp rclcpp-components sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ can-msgs dataspeed-can-msg-filters dataspeed-can-usb dataspeed-dbw-common dataspeed-ulc-can dbw-fca-description dbw-fca-msgs geometry-msgs rclcpp rclcpp-components sensor-msgs std-msgs ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "dbw_fca_can" = substituteSource {
      src = fetchgit {
        name = "dbw_fca_can-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "13bf18e8cd3d609ddd9be7f996bef609ffa07834";
        hash = "sha256-oJdhp6LpG45Qf9sPFTXRi9fji8GQxsODyov45mhr/dI=";
      };
    };
  });
  meta = {
    description = "\n    Drive-by-wire interface to the Dataspeed Inc. Chrysler Pacifica DBW kit\n  ";
  };
})
