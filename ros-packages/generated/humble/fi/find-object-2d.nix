{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  image-transport,
  message-filters,
  mkSourceSet,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "find_object_2d";
  version = "0.7.0-1";
  src = finalAttrs.passthru.sources."find_object_2d";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces cv-bridge geometry-msgs image-transport message-filters rclcpp ros-environment rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces cv-bridge geometry-msgs image-transport message-filters rclcpp ros-environment rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "find_object_2d" = substituteSource {
      src = fetchgit {
        name = "find_object_2d-source";
        url = "https://github.com/ros2-gbp/find_object_2d-release.git";
        rev = "8b362c3804320e10ccb31beccc1d17919f22ebda";
        hash = "sha256-KtLe1v52K9gb/p4t0Yqdkc99Hgi67wNcFpmguOilOnA=";
      };
    };
  });
  meta = {
    description = "The find_object_2d package";
  };
})
