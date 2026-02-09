{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  create3-examples-msgs,
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
  substituteSource,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "create3_coverage";
  version = "0.0.5-1";
  src = finalAttrs.passthru.sources."create3_coverage";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ create3-examples-msgs geometry-msgs irobot-create-msgs nav-msgs rclcpp rclcpp-action tf2-geometry-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ create3-examples-msgs geometry-msgs irobot-create-msgs nav-msgs rclcpp rclcpp-action tf2-geometry-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "create3_coverage" = substituteSource {
      src = fetchgit {
        name = "create3_coverage-source";
        url = "https://github.com/ros2-gbp/create3_examples-release.git";
        rev = "da788f6503b42d5b0a4482e16f3237cacfc8d534";
        hash = "sha256-alQ50AUW8XhBP9FxNI2x4bVkE4/iMykvjkO5ENR9Mr8=";
      };
    };
  });
  meta = {
    description = "C++ action server exposing a non-systematic coverage behavior";
  };
})
