{
  ament-cmake-auto,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-plugins,
  gazebo-ros,
  gazebo-ros2-control,
  launch,
  launch-pal,
  launch-ros,
  launch-testing-ament-cmake,
  mkSourceSet,
  omni-base-description,
  pal-gazebo-plugins,
  pal-gazebo-worlds,
  pal-maps,
  pal-urdf-utils,
  play-motion2-msgs,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tiago-2dnav,
  tiago-bringup,
  tiago-description,
  tiago-laser-sensors,
  tiago-moveit-config,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_gazebo";
  version = "4.8.0-1";
  src = finalAttrs.passthru.sources."tiago_gazebo";
  nativeBuildInputs = [ ament-cmake-auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gazebo-plugins gazebo-ros gazebo-ros2-control launch launch-pal launch-ros omni-base-description pal-gazebo-plugins pal-gazebo-worlds pal-maps pal-urdf-utils play-motion2-msgs tiago-2dnav tiago-bringup tiago-description tiago-laser-sensors tiago-moveit-config ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ gazebo-plugins gazebo-ros gazebo-ros2-control launch launch-pal launch-ros omni-base-description pal-gazebo-plugins pal-gazebo-worlds pal-maps pal-urdf-utils play-motion2-msgs tiago-2dnav tiago-bringup tiago-description tiago-laser-sensors tiago-moveit-config ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common launch-testing-ament-cmake play-motion2-msgs rclcpp sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_gazebo" = substituteSource {
      src = fetchgit {
        name = "tiago_gazebo-source";
        url = "https://github.com/pal-gbp/tiago_simulation-release.git";
        rev = "61ee6a5f8d818eb9f1c0bc4c7140d70e4e951604";
        hash = "sha256-QCu1UR6CbsrUydMrqR7OUWJV3OXMuR58I3rzS1T3lxI=";
      };
    };
  });
  meta = {
    description = "The tiago_gazebo package";
  };
})
