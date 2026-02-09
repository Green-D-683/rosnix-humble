{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  launch-testing,
  mkSourceSet,
  nav2-common,
  navigation2,
  rosSystemPackages,
  slam-toolbox,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_bringup";
  version = "1.1.20-1";
  src = finalAttrs.passthru.sources."nav2_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch-ros nav2-common navigation2 slam-toolbox ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch-ros nav2-common navigation2 slam-toolbox ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_bringup" = substituteSource {
      src = fetchgit {
        name = "nav2_bringup-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "9babd2eb8623e38ec477ae75e1c40a704a4f694b";
        hash = "sha256-qRhv1YDG5F1GHE91ejfyDABZWP9keXcWXERFzJ5ugM4=";
      };
    };
  });
  meta = {
    description = "Bringup scripts and configurations for the Nav2 stack";
  };
})
