{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-index-cpp,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  autoware-utils,
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
  pname = "autoware_vehicle_info_utils";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_vehicle_info_utils";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-utils rclcpp ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-utils rclcpp ];
  checkInputs = [ ament-cmake-ros ament-index-cpp ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_vehicle_info_utils" = substituteSource {
      src = fetchgit {
        name = "autoware_vehicle_info_utils-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "00e199e8f4fa272803dc17e0901a8a43d1e85a98";
        hash = "sha256-2btr3kuChfhpqV7Rob1AlqfQ3Zi9kyK3HPPG0S5srTc=";
      };
    };
  });
  meta = {
    description = "The autoware_vehicle_info_utils package";
  };
})
