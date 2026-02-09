{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  joint-state-publisher-gui,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "open_manipulator_x_description";
  version = "3.0.4-1";
  src = finalAttrs.passthru.sources."open_manipulator_x_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ joint-state-publisher joint-state-publisher-gui robot-state-publisher rviz2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher joint-state-publisher-gui robot-state-publisher rviz2 ];
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator_x_description" = substituteSource {
      src = fetchgit {
        name = "open_manipulator_x_description-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "0bebe0992b662b2c3fe17ca24bfc96d50d5c3938";
        hash = "sha256-GOYosexAlYcLJzCsZ7q+RVxeyQqWo3E92Q5Zz1E7sp8=";
      };
    };
  });
  meta = {
    description = "\n    open_manipulator_x_description ROS 2 package.\n  ";
  };
})
