{
  ament-cmake-auto,
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
  mkSourceSet,
  omni-base-description,
  pal-gazebo-plugins,
  pal-gazebo-worlds,
  pal-maps,
  pal-pro-gripper-description,
  pal-urdf-utils,
  play-motion2-msgs,
  rosSystemPackages,
  substituteSource,
  tiago-pro-2dnav,
  tiago-pro-bringup,
  tiago-pro-description,
  tiago-pro-head-description,
  tiago-pro-laser-sensors,
  tiago-pro-moveit-config,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_pro_gazebo";
  version = "1.12.2-1";
  src = finalAttrs.passthru.sources."tiago_pro_gazebo";
  nativeBuildInputs = [ ament-cmake-auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gazebo-plugins gazebo-ros gazebo-ros2-control launch launch-pal launch-ros omni-base-description pal-gazebo-plugins pal-gazebo-worlds pal-maps pal-pro-gripper-description pal-urdf-utils play-motion2-msgs tiago-pro-2dnav tiago-pro-bringup tiago-pro-description tiago-pro-head-description tiago-pro-laser-sensors tiago-pro-moveit-config ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ gazebo-plugins gazebo-ros gazebo-ros2-control launch launch-pal launch-ros omni-base-description pal-gazebo-plugins pal-gazebo-worlds pal-maps pal-pro-gripper-description pal-urdf-utils play-motion2-msgs tiago-pro-2dnav tiago-pro-bringup tiago-pro-description tiago-pro-head-description tiago-pro-laser-sensors tiago-pro-moveit-config ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_pro_gazebo" = substituteSource {
      src = fetchgit {
        name = "tiago_pro_gazebo-source";
        url = "https://github.com/ros2-gbp/tiago_pro_simulation-release.git";
        rev = "9f827fd3b71695a872a3e5764a5b61024913dd0a";
        hash = "sha256-N19Sxox7Zl7RWshf/yME/Ezepd6EUWV+ZZwDcWAoejc=";
      };
    };
  });
  meta = {
    description = "The tiago_pro_gazebo package";
  };
})
