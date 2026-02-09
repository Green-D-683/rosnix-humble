{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rmw-cyclonedds-cpp,
  rmw-fastrtps-cpp,
  robot-upstart,
  rosSystemPackages,
  simple-term-menu-vendor,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_setup";
  version = "1.0.6-1";
  src = finalAttrs.passthru.sources."turtlebot4_setup";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rmw-cyclonedds-cpp rmw-fastrtps-cpp robot-upstart simple-term-menu-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "chrony" "curl" "network-manager" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rmw-cyclonedds-cpp rmw-fastrtps-cpp robot-upstart simple-term-menu-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "chrony" "curl" "network-manager" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_setup" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_setup-source";
        url = "https://github.com/ros2-gbp/turtlebot4_setup-release.git";
        rev = "9db0f16b7b2752ed9febb7b91e4a33ad99209c13";
        hash = "sha256-osrPJX4MQ7vK0eNc/uHOS4PSkl7Nz+oXIpueX0wu5nM=";
      };
    };
  });
  meta = {
    description = "Turtlebot4 setup scripts";
  };
})
