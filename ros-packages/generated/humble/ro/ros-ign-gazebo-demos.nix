{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-gz-sim-demos,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_ign_gazebo_demos";
  version = "0.244.21-1";
  src = finalAttrs.passthru.sources."ros_ign_gazebo_demos";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ros-gz-sim-demos ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-gz-sim-demos ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros_ign_gazebo_demos" = substituteSource {
      src = fetchgit {
        name = "ros_ign_gazebo_demos-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "849a92d08444dffa39bcd004b7cd5f0c02521432";
        hash = "sha256-YyeFI9OWq6pHvnF2NTXY103mUhZVjwIXHW9kOXjsuIg=";
      };
    };
  });
  meta = {
    description = "Shim package to redirect to ros_gz_sim_demos.";
  };
})
