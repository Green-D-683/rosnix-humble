{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  irobot-create-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-action,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "create3_republisher";
  version = "0.0.5-1";
  src = finalAttrs.passthru.sources."create3_republisher";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs irobot-create-msgs nav-msgs rclcpp rclcpp-action sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs irobot-create-msgs nav-msgs rclcpp rclcpp-action sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "create3_republisher" = substituteSource {
      src = fetchgit {
        name = "create3_republisher-source";
        url = "https://github.com/ros2-gbp/create3_examples-release.git";
        rev = "477a9ad96f296d6f71a361418851163ceb0c94ee";
        hash = "sha256-ApcELf6T+8U1nErvCdzq4DNtHI3QTKhMIYU1xVsKcnY=";
      };
    };
  });
  meta = {
    description = "C++ action server exposing a non-systematic coverage behavior";
  };
})
