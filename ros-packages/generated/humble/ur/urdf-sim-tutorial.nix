{
  ament-cmake,
  buildAmentCmakePackage,
  controller-manager,
  diff-drive-controller,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-ros,
  mkSourceSet,
  position-controllers,
  robot-state-publisher,
  rosSystemPackages,
  rqt-robot-steering,
  rviz2,
  substituteSource,
  urdf-tutorial,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "urdf_sim_tutorial";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."urdf_sim_tutorial";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager diff-drive-controller gazebo-ros position-controllers robot-state-publisher rqt-robot-steering rviz2 urdf-tutorial xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager diff-drive-controller gazebo-ros position-controllers robot-state-publisher rqt-robot-steering rviz2 urdf-tutorial xacro ];
  passthru.sources = mkSourceSet (sources: {
    "urdf_sim_tutorial" = substituteSource {
      src = fetchgit {
        name = "urdf_sim_tutorial-source";
        url = "https://github.com/ros-gbp/urdf_sim_tutorial-release.git";
        rev = "2f771454c4fd6b5ac0d0da941381ea5ceb6dfb93";
        hash = "sha256-keg//XCnL5YgaahyoB1EYqKWPKbP1iigvjDOMjh4OHw=";
      };
    };
  });
  meta = {
    description = "The urdf_sim_tutorial package";
  };
})
