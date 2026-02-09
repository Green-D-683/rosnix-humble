{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-interpolation,
  autoware-lint-common,
  autoware-perception-msgs,
  autoware-utils-geometry,
  autoware-utils-math,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  pcl-conversions,
  pcl-ros,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-eigen,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_object_recognition_utils";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_object_recognition_utils";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-interpolation autoware-perception-msgs autoware-utils-geometry autoware-utils-math geometry-msgs pcl-conversions pcl-ros rclcpp sensor-msgs std-msgs tf2 tf2-eigen ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-dev" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-interpolation autoware-perception-msgs autoware-utils-geometry autoware-utils-math geometry-msgs pcl-conversions pcl-ros rclcpp sensor-msgs std-msgs tf2 tf2-eigen ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_object_recognition_utils" = substituteSource {
      src = fetchgit {
        name = "autoware_object_recognition_utils-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "e003ab7f0dd16a6a54e72cd447c39446c865e4b7";
        hash = "sha256-0agEVKzrhF8AblEVTAUDdVadD+1/QQEx9JSHljQA8WE=";
      };
    };
  });
  meta = {
    description = "The autoware_object_recognition_utils package";
  };
})
