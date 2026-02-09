{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclpy,
  rmw,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "interactive_markers";
  version = "2.3.2-2";
  src = finalAttrs.passthru.sources."interactive_markers";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ builtin-interfaces rclcpp rclpy rmw tf2 tf2-geometry-msgs visualization-msgs ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ builtin-interfaces rclcpp rclpy rmw tf2 tf2-geometry-msgs visualization-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common geometry-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "interactive_markers" = substituteSource {
      src = fetchgit {
        name = "interactive_markers-source";
        url = "https://github.com/ros2-gbp/interactive_markers-release.git";
        rev = "dace99fbd8e164b82258ba4bc7f8bc213c9140b4";
        hash = "sha256-AOue7aI9DAZ4GHtHtOAPRcV7DJ0zvONib2v2n+DIggY=";
      };
    };
  });
  meta = {
    description = "\n     3D interactive marker communication library for RViz and similar tools.\n  ";
  };
})
