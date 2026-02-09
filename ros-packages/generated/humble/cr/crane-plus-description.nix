{
  ament-cmake,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-ros2-control,
  ign-ros2-control,
  joint-state-publisher-gui,
  launch,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "crane_plus_description";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."crane_plus_description";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gazebo-ros2-control ign-ros2-control joint-state-publisher-gui launch robot-state-publisher rviz2 xacro ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ gazebo-ros2-control ign-ros2-control joint-state-publisher-gui launch robot-state-publisher rviz2 xacro ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "crane_plus_description" = substituteSource {
      src = fetchgit {
        name = "crane_plus_description-source";
        url = "https://github.com/ros2-gbp/crane_plus-release.git";
        rev = "685c9e569af592ba09e89181399a19581382f1f8";
        hash = "sha256-gfvOwbCgTtEl9cJ4d/h1gy7uxF7wuZLjkLssnnLRuDc=";
      };
    };
  });
  meta = {
    description = "CRANE+ V2 description package";
  };
})
