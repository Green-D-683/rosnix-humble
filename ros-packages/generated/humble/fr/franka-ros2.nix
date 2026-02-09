{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  franka-bringup,
  franka-description,
  franka-example-controllers,
  franka-fr3-moveit-config,
  franka-gazebo-bringup,
  franka-gripper,
  franka-hardware,
  franka-ign-ros2-control,
  franka-msgs,
  libfranka,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "franka_ros2";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."franka_ros2";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ franka-bringup franka-description franka-example-controllers franka-fr3-moveit-config franka-gazebo-bringup franka-gripper franka-hardware franka-ign-ros2-control franka-msgs libfranka ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ franka-bringup franka-description franka-example-controllers franka-fr3-moveit-config franka-gazebo-bringup franka-gripper franka-hardware franka-ign-ros2-control franka-msgs libfranka ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "franka_ros2" = substituteSource {
      src = fetchgit {
        name = "franka_ros2-source";
        url = "https://github.com/ros2-gbp/franka_ros2-release.git";
        rev = "d47aaabdb3ef2d56f4534883d3a9ab0172a84cf9";
        hash = "sha256-Zk5xyx6wURTj/9U5s+2Jrn9qkeZK4I2ytL4F+J2hrL8=";
      };
    };
  });
  meta = {
    description = "Meta package of franka_ros2";
  };
})
