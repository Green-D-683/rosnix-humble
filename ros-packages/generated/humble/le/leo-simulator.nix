{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo-gz-bringup,
  leo-gz-plugins,
  leo-gz-worlds,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_simulator";
  version = "1.1.2-1";
  src = finalAttrs.passthru.sources."leo_simulator";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ leo-gz-bringup leo-gz-plugins leo-gz-worlds ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ leo-gz-bringup leo-gz-plugins leo-gz-worlds ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_simulator" = substituteSource {
      src = fetchgit {
        name = "leo_simulator-source";
        url = "https://github.com/ros2-gbp/leo_simulator-release.git";
        rev = "7939ff297afaac2e95ccf0cc66d947955c503daa";
        hash = "sha256-F9IAcB82Sjmng5T6rWaOAI3LQiA4l1z/XpRol2bnflQ=";
      };
    };
  });
  meta = {
    description = "\n    Metapackage for Leo Rover Gazebo simulation in ROS2\n  ";
  };
})
