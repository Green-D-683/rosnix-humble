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
  nav2-common,
  nav2-costmap-2d,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "costmap_queue";
  version = "1.1.20-1";
  src = finalAttrs.passthru.sources."costmap_queue";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ nav2-common nav2-costmap-2d rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ nav2-common nav2-costmap-2d rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "costmap_queue" = substituteSource {
      src = fetchgit {
        name = "costmap_queue-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "503dc547035e458b0cd29243a24c5bf575faa513";
        hash = "sha256-MAEaiw42/XERGR7U7Xaq1DxkyTYXZdZViVadg/lHv3g=";
      };
    };
  });
  meta = {
    description = "The costmap_queue package";
  };
})
