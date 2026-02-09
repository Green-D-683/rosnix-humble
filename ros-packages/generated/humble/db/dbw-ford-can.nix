{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  can-msgs,
  dataspeed-can-msg-filters,
  dataspeed-can-usb,
  dataspeed-dbw-common,
  dataspeed-ulc-can,
  dbw-ford-description,
  dbw-ford-msgs,
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
  pname = "dbw_ford_can";
  version = "2.1.16-1";
  src = finalAttrs.passthru.sources."dbw_ford_can";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ can-msgs dataspeed-can-msg-filters dataspeed-can-usb dataspeed-dbw-common dataspeed-ulc-can dbw-ford-description dbw-ford-msgs geometry-msgs rclcpp rclcpp-components sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ can-msgs dataspeed-can-msg-filters dataspeed-can-usb dataspeed-dbw-common dataspeed-ulc-can dbw-ford-description dbw-ford-msgs geometry-msgs rclcpp rclcpp-components sensor-msgs std-msgs ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "dbw_ford_can" = substituteSource {
      src = fetchgit {
        name = "dbw_ford_can-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "0b22af649e70f1c18662651a30f47d01149b761f";
        hash = "sha256-ibu88joHkvYhWwsQqUxQBJ3GF6EjZWD35QOohWgjyqI=";
      };
    };
  });
  meta = {
    description = "\n    Drive-by-wire interface to the Dataspeed Inc. Ford DBW kit\n  ";
  };
})
