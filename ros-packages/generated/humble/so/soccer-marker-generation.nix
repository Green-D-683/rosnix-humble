{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  soccer-object-msgs,
  substituteSource,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "soccer_marker_generation";
  version = "0.0.2-3";
  src = finalAttrs.passthru.sources."soccer_marker_generation";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp soccer-object-msgs visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp soccer-object-msgs visualization-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "soccer_marker_generation" = substituteSource {
      src = fetchgit {
        name = "soccer_marker_generation-source";
        url = "https://github.com/ros2-gbp/soccer_visualization-release.git";
        rev = "01da0b4dbb28210916847d97feab66618ec23347";
        hash = "sha256-3P3fmHnpeTlaI9ykWoLBv5F8HGk9vEReSDRKIvZum+Q=";
      };
    };
  });
  meta = {
    description = "Generates rviz display markers from soccer msgs";
  };
})
