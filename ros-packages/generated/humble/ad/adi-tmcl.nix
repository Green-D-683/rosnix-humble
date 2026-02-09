{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  ros2launch,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "adi_tmcl";
  version = "2.0.3-2";
  src = finalAttrs.passthru.sources."adi_tmcl";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ geometry-msgs rclcpp ros2launch rosidl-default-runtime std-msgs std-srvs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rclcpp ros2launch rosidl-default-runtime std-msgs std-srvs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "adi_tmcl" = substituteSource {
      src = fetchgit {
        name = "adi_tmcl-source";
        url = "https://github.com/ros2-gbp/adi_tmcl-release.git";
        rev = "a85beacad4f613b93b214d1c0c02712fba9c82aa";
        hash = "sha256-MSqR6p/1iZbuEM2wtip5HTj8aKmJI+1MMN9MenoWlA4=";
      };
    };
  });
  meta = {
    description = "The adi_tmcl ROS2 package";
  };
})
