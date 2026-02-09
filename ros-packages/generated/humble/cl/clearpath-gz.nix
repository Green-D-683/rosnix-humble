{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  clearpath-common,
  clearpath-generator-gz,
  clearpath-viz,
  fetchgit,
  fetchurl,
  fetchzip,
  ign-ros2-control,
  mkSourceSet,
  ros-gz,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_gz";
  version = "1.3.2-1";
  src = finalAttrs.passthru.sources."clearpath_gz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ clearpath-common clearpath-generator-gz clearpath-viz ign-ros2-control ros-gz ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-common clearpath-generator-gz clearpath-viz ign-ros2-control ros-gz ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_gz" = substituteSource {
      src = fetchgit {
        name = "clearpath_gz-source";
        url = "https://github.com/clearpath-gbp/clearpath_simulator-release.git";
        rev = "141e9d487ca7be696c5bf588ee6e9b95b5e1c082";
        hash = "sha256-iAf2LnxUmCDCLUnMkPJhHmNrBMgj+hPOcrhh0mFB7bs=";
      };
    };
  });
  meta = {
    description = "Clearpath Gazebo Simulator";
  };
})
