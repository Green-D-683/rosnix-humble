{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  controller-manager,
  diff-drive-controller,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-broadcaster,
  mkSourceSet,
  raspimouse-description,
  raspimouse-fake,
  robot-state-publisher,
  ros-gz,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "raspimouse_gazebo";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."raspimouse_gazebo";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager diff-drive-controller joint-state-broadcaster raspimouse-description raspimouse-fake robot-state-publisher ros-gz ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager diff-drive-controller joint-state-broadcaster raspimouse-description raspimouse-fake robot-state-publisher ros-gz ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "raspimouse_gazebo" = substituteSource {
      src = fetchgit {
        name = "raspimouse_gazebo-source";
        url = "https://github.com/ros2-gbp/raspimouse_sim-release.git";
        rev = "f196d60e9b3f669bc3545ad9a7d3c7d8a93a0ebb";
        hash = "sha256-iock0uWiUt2Idr4bcnw1MMweVen8ti4o406a8SnhBoQ=";
      };
    };
  });
  meta = {
    description = "The raspimouse_gazebo package";
  };
})
