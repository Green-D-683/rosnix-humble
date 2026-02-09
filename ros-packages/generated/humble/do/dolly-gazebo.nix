{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  dolly-follow,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-ros-pkgs,
  mkSourceSet,
  ros2launch,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dolly_gazebo";
  version = "0.4.0-3";
  src = finalAttrs.passthru.sources."dolly_gazebo";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ dolly-follow gazebo-ros-pkgs ros2launch rviz2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dolly-follow gazebo-ros-pkgs ros2launch rviz2 ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dolly_gazebo" = substituteSource {
      src = fetchgit {
        name = "dolly_gazebo-source";
        url = "https://github.com/ros2-gbp/dolly-release.git";
        rev = "1faae2586d9bff0da482d5d2dcb4716e649790f7";
        hash = "sha256-sLCbhJjIRzZvq15SlStZjonIvhpPw57fK5vRlQ3689A=";
      };
    };
  });
  meta = {
    description = "\n    Launch Gazebo simulation with Dolly robot.\n  ";
  };
})
