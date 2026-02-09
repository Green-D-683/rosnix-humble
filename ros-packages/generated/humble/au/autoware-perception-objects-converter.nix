{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  autoware-perception-msgs,
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
  unique-identifier-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_perception_objects_converter";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_perception_objects_converter";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-perception-msgs geometry-msgs rclcpp rclcpp-components unique-identifier-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-perception-msgs geometry-msgs rclcpp rclcpp-components unique-identifier-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_perception_objects_converter" = substituteSource {
      src = fetchgit {
        name = "autoware_perception_objects_converter-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "3b28bd0943fb531077df35ae738e198159c58f90";
        hash = "sha256-oLUP+ENjDZrcfXUOu29EamuoZ2GhjxQx2VrlYA3CWUs=";
      };
    };
  });
  meta = {
    description = "ROS 2 node for converting between different perception object message types";
  };
})
