{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-gz,
  ros-ign-bridge,
  ros-ign-gazebo,
  ros-ign-gazebo-demos,
  ros-ign-image,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_ign";
  version = "0.244.21-1";
  src = finalAttrs.passthru.sources."ros_ign";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ros-gz ros-ign-bridge ros-ign-gazebo ros-ign-gazebo-demos ros-ign-image ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-gz ros-ign-bridge ros-ign-gazebo ros-ign-gazebo-demos ros-ign-image ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros_ign" = substituteSource {
      src = fetchgit {
        name = "ros_ign-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "d67aa1853c6b50d78e64c048038fd42f1d5acc78";
        hash = "sha256-7m+O2OQlcfiWaZBAu6IriP3AS0qRYhrTXTxrAlR9Z3Q=";
      };
    };
  });
  meta = {
    description = "Shim meta-package to redirect to ";
  };
})
