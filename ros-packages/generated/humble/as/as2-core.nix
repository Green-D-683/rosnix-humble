{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  as2-msgs,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  geometry-msgs,
  image-transport,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "as2_core";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."as2_core";
  propagatedNativeBuildInputs = [ ament-cmake as2-msgs cv-bridge geographic-msgs geometry-msgs image-transport nav-msgs rclcpp rclcpp-action rclcpp-lifecycle sensor-msgs std-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "geographiclib" "pybind11-dev" "yaml-cpp" ]; };
  propagatedBuildInputs = [ ament-cmake as2-msgs cv-bridge geographic-msgs geometry-msgs image-transport nav-msgs rclcpp rclcpp-action rclcpp-lifecycle sensor-msgs std-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "geographiclib" "pybind11-dev" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "as2_core" = substituteSource {
      src = fetchgit {
        name = "as2_core-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "2ed092e45a890c3211b19e579f9b99b8a75fa821";
        hash = "sha256-5gPB3UgOe+y9csx/lmPLyQOe80MetZTq01w6iR72sxg=";
      };
    };
  });
  meta = {
    description = "Aerostack2 core package which contains the basic classes of the Aerostack2 framework";
  };
})
