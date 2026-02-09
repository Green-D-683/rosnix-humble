{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  autoware-vehicle-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_vehicle_velocity_converter";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_vehicle_velocity_converter";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-vehicle-msgs geometry-msgs rclcpp rclcpp-components ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-vehicle-msgs geometry-msgs rclcpp rclcpp-components ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_vehicle_velocity_converter" = substituteSource {
      src = fetchgit {
        name = "autoware_vehicle_velocity_converter-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "b60044c13b46d3457baa3ab44fb56d69b6259dc0";
        hash = "sha256-vTe/XF5gM7nxoLBKYNt24wPFzf6BkYXQ9YyjKoLW3eo=";
      };
    };
  });
  meta = {
    description = "The autoware_vehicle_velocity_converter package";
  };
})
