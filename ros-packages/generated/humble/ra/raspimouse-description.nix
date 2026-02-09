{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ign-ros2-control,
  joint-state-publisher,
  joint-state-publisher-gui,
  launch,
  mkSourceSet,
  realsense2-description,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "raspimouse_description";
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."raspimouse_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ign-ros2-control joint-state-publisher joint-state-publisher-gui launch realsense2-description robot-state-publisher rviz2 urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ign-ros2-control joint-state-publisher joint-state-publisher-gui launch realsense2-description robot-state-publisher rviz2 urdf xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "raspimouse_description" = substituteSource {
      src = fetchgit {
        name = "raspimouse_description-source";
        url = "https://github.com/ros2-gbp/raspimouse_description-release.git";
        rev = "e1115c86ed0766df4d488d58ff2ee7b14879d807";
        hash = "sha256-jeuxiJ92y6oLmmPYRGOpXHagjJW6LoIb2BjVqYQLwdQ=";
      };
    };
  });
  meta = {
    description = "The raspimouse_description package";
  };
})
