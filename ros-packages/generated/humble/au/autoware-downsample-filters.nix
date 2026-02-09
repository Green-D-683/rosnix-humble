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
  mkSourceSet,
  pcl-conversions,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_downsample_filters";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_downsample_filters";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-point-types autoware-utils-debug autoware-utils-system autoware-utils-tf pcl-conversions rclcpp sensor-msgs ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-point-types autoware-utils-debug autoware-utils-system autoware-utils-tf pcl-conversions rclcpp sensor-msgs ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_downsample_filters" = substituteSource {
      src = fetchgit {
        name = "autoware_downsample_filters-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "d79c7de0e64a0a7310adb6d232cfaff7ec9901d0";
        hash = "sha256-D65dEtld2eIXT6J1BH1k5YIh0b5sRN87JvEsDIZ9wOg=";
      };
    };
  });
  meta = {
    description = "The ROS 2 autoware_downsample_filters package";
  };
})
