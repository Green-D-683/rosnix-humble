{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  irobot-create-common-bringup,
  irobot-create-description,
  irobot-create-ignition-bringup,
  irobot-create-ignition-toolbox,
  irobot-create-msgs,
  irobot-create-nodes,
  irobot-create-toolbox,
  mkSourceSet,
  ros-ign-bridge,
  ros-ign-gazebo,
  ros-ign-interfaces,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  turtlebot4-description,
  turtlebot4-ignition-gui-plugins,
  turtlebot4-ignition-toolbox,
  turtlebot4-msgs,
  turtlebot4-navigation,
  turtlebot4-node,
  turtlebot4-viz,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_ignition_bringup";
  version = "1.0.3-1";
  src = finalAttrs.passthru.sources."turtlebot4_ignition_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ geometry-msgs irobot-create-common-bringup irobot-create-description irobot-create-ignition-bringup irobot-create-ignition-toolbox irobot-create-msgs irobot-create-nodes irobot-create-toolbox ros-ign-bridge ros-ign-gazebo ros-ign-interfaces std-msgs turtlebot4-description turtlebot4-ignition-gui-plugins turtlebot4-ignition-toolbox turtlebot4-msgs turtlebot4-navigation turtlebot4-node turtlebot4-viz ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs irobot-create-common-bringup irobot-create-description irobot-create-ignition-bringup irobot-create-ignition-toolbox irobot-create-msgs irobot-create-nodes irobot-create-toolbox ros-ign-bridge ros-ign-gazebo ros-ign-interfaces std-msgs turtlebot4-description turtlebot4-ignition-gui-plugins turtlebot4-ignition-toolbox turtlebot4-msgs turtlebot4-navigation turtlebot4-node turtlebot4-viz ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_ignition_bringup" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_ignition_bringup-source";
        url = "https://github.com/ros2-gbp/turtlebot4_simulator-release.git";
        rev = "6387d3a7aeaf2f9680e00c9f7527b91f6bfa22c4";
        hash = "sha256-/GWy/mjnV8LwWX6bFWw+o4TQs1lKMcD4iiga53Z9WaE=";
      };
    };
  });
  meta = {
    description = "TurtleBot 4 Ignition Simulator bringup";
  };
})
