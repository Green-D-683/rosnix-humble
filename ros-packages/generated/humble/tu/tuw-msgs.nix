{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
  tuw-airskin-msgs,
  tuw-geometry-msgs,
  tuw-graph-msgs,
  tuw-multi-robot-msgs,
  tuw-nav-msgs,
  tuw-object-map-msgs,
  tuw-object-msgs,
  tuw-std-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tuw_msgs";
  version = "0.2.6-1";
  src = finalAttrs.passthru.sources."tuw_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-components tuw-airskin-msgs tuw-geometry-msgs tuw-graph-msgs tuw-multi-robot-msgs tuw-nav-msgs tuw-object-map-msgs tuw-object-msgs tuw-std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components tuw-airskin-msgs tuw-geometry-msgs tuw-graph-msgs tuw-multi-robot-msgs tuw-nav-msgs tuw-object-map-msgs tuw-object-msgs tuw-std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_msgs-source";
        url = "https://github.com/tuw-robotics/tuw_msgs-release.git";
        rev = "1194d77f05e911cfdcd78a73d35ee49d2f5afed7";
        hash = "sha256-w01u6K5+7vngROfLPfWxYYDFTneIusoTcVs2RpxoUJE=";
      };
    };
  });
  meta = {
    description = "tuw_msgs meta package with write and read file libs for tuw_msgs";
  };
})
