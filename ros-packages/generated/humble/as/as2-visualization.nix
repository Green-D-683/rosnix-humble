{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  as2-gazebo-assets,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  robot-state-publisher,
  ros-gz,
  rosSystemPackages,
  rviz2,
  sdformat-urdf,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "as2_visualization";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."as2_visualization";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ as2-gazebo-assets robot-state-publisher ros-gz rviz2 sdformat-urdf ];
  propagatedBuildInputs = [ as2-gazebo-assets robot-state-publisher ros-gz rviz2 sdformat-urdf ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "as2_visualization" = substituteSource {
      src = fetchgit {
        name = "as2_visualization-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "b3e5c24a874b520fff15414d451c4170cf70f82f";
        hash = "sha256-lqH7B6BY6WvgUEvEzbSBfqd+r3fdXbOPb9AEqaIkRKE=";
      };
    };
  });
  meta = {
    description = "Aerostack2 Visualization Tools";
  };
})
