{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  can-msgs,
  dataspeed-dbw-common,
  dataspeed-ulc-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclpy,
  ros-testing,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dataspeed_ulc_can";
  version = "2.1.16-1";
  src = finalAttrs.passthru.sources."dataspeed_ulc_can";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ can-msgs dataspeed-dbw-common dataspeed-ulc-msgs geometry-msgs rclcpp rclpy std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ can-msgs dataspeed-dbw-common dataspeed-ulc-msgs geometry-msgs rclcpp rclpy std-msgs ];
  checkInputs = [ ament-cmake-gtest ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "dataspeed_ulc_can" = substituteSource {
      src = fetchgit {
        name = "dataspeed_ulc_can-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "2b7f30f8318df10acc541f3bda677e7fd5eba344";
        hash = "sha256-ctLfCDP8Fllls/tcmUBZIjl489K/e0xuU+5uPQeb0Pk=";
      };
    };
  });
  meta = {
    description = "\n    Package to translate ROS messages to and from CAN messages to interact with the Universal Lat/Lon Controller (ULC) firmware\n  ";
  };
})
