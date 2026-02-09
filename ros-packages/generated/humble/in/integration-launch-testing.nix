{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-xmllint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "integration_launch_testing";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."integration_launch_testing";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-copyright ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-xmllint launch-testing ];
  passthru.sources = mkSourceSet (sources: {
    "integration_launch_testing" = substituteSource {
      src = fetchgit {
        name = "integration_launch_testing-source";
        url = "https://github.com/ros2-gbp/franka_ros2-release.git";
        rev = "36249263f5f658ce4488fec0c9312d27c652d609";
        hash = "sha256-7Ve+qr8g41V598UliDJgXXuLeidV+6+i199Tm9XxkB8=";
      };
    };
  });
  meta = {
    description = "Functional integration tests for franka controllers";
  };
})
