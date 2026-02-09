{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  autoware-point-types,
  autoware-utils-debug,
  autoware-utils-system,
  autoware-utils-tf,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  pcl-conversions,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-eigen,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_crop_box_filter";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_crop_box_filter";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-point-types autoware-utils-debug autoware-utils-system autoware-utils-tf geometry-msgs pcl-conversions rclcpp rclcpp-components sensor-msgs tf2-eigen ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-point-types autoware-utils-debug autoware-utils-system autoware-utils-tf geometry-msgs pcl-conversions rclcpp rclcpp-components sensor-msgs tf2-eigen ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_crop_box_filter" = substituteSource {
      src = fetchgit {
        name = "autoware_crop_box_filter-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "5b383c394291003c4621753cd293ef0ee26cc3e2";
        hash = "sha256-hmXukfbaYnK2sdYmejlLyVWZybbC82/bn2hThJ/i/Oo=";
      };
    };
  });
  meta = {
    description = "The ROS 2 autoware_crop_box_filter package";
  };
})
