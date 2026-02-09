{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  as2-behavior,
  as2-core,
  as2-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "as2_behaviors_path_planning";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."as2_behaviors_path_planning";
  propagatedNativeBuildInputs = [ ament-cmake as2-behavior as2-core as2-msgs geometry-msgs nav-msgs rclcpp tf2-ros visualization-msgs ];
  propagatedBuildInputs = [ ament-cmake as2-behavior as2-core as2-msgs geometry-msgs nav-msgs rclcpp tf2-ros visualization-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "as2_behaviors_path_planning" = substituteSource {
      src = fetchgit {
        name = "as2_behaviors_path_planning-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "9000607b67703a449be18174af8b2d780ae8717a";
        hash = "sha256-kopzaD0Fv+NcPUGdZtWMZtFDkFsbA2N2R6ntGNX0R/c=";
      };
    };
  });
  meta = {
    description = "Aerostack2 behaviors collection for path planning";
  };
})
