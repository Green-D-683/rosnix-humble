{
  ament-cmake-gtest,
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  ros2-socketcan,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dataspeed_dbw_common";
  version = "2.1.16-1";
  src = finalAttrs.passthru.sources."dataspeed_dbw_common";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rclcpp ros2-socketcan ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rclcpp ros2-socketcan ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "dataspeed_dbw_common" = substituteSource {
      src = fetchgit {
        name = "dataspeed_dbw_common-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "f6e65048b1f1d9158c07823bc2d09505ed5b024b";
        hash = "sha256-GAUFEZjUbp2vArMBY6U+ZiNCslm+AnDpmZa8GpM8eaM=";
      };
    };
  });
  meta = {
    description = "\n    Common interfaces for drive-by-wire.\n  ";
  };
})
