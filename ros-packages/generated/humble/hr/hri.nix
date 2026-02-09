{
  ament-cmake-auto,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  hri-msgs,
  magic-enum,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "hri";
  version = "2.6.1-1";
  src = finalAttrs.passthru.sources."hri";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ cv-bridge geometry-msgs hri-msgs magic-enum rclcpp rclcpp-lifecycle sensor-msgs std-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" ]; };
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs hri-msgs magic-enum rclcpp rclcpp-lifecycle sensor-msgs std-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "hri" = substituteSource {
      src = fetchgit {
        name = "hri-source";
        url = "https://github.com/ros4hri/libhri-release.git";
        rev = "c79d736778c07869954c223d22eb8a7395108f67";
        hash = "sha256-62U6p03BuEm9RybkR4bIhwWwFMhEXmQSwYs42bRsm2g=";
      };
    };
  });
  meta = {
    description = "A wrapper library around the ROS4HRI ROS topics";
  };
})
