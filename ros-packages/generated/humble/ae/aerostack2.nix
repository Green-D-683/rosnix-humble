{
  ament-cmake,
  as2-alphanumeric-viewer,
  as2-behavior,
  as2-behavior-tree,
  as2-behaviors-motion,
  as2-behaviors-path-planning,
  as2-behaviors-perception,
  as2-behaviors-platform,
  as2-behaviors-trajectory-generation,
  as2-cli,
  as2-core,
  as2-external-object-to-tf,
  as2-gazebo-assets,
  as2-geozones,
  as2-keyboard-teleoperation,
  as2-map-server,
  as2-motion-controller,
  as2-motion-reference-handlers,
  as2-msgs,
  as2-platform-gazebo,
  as2-platform-multirotor-simulator,
  as2-python-api,
  as2-realsense-interface,
  as2-rviz-plugins,
  as2-state-estimator,
  as2-usb-camera-interface,
  as2-visualization,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "aerostack2";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."aerostack2";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ as2-alphanumeric-viewer as2-behavior as2-behavior-tree as2-behaviors-motion as2-behaviors-path-planning as2-behaviors-perception as2-behaviors-platform as2-behaviors-trajectory-generation as2-cli as2-core as2-external-object-to-tf as2-gazebo-assets as2-geozones as2-keyboard-teleoperation as2-map-server as2-motion-controller as2-motion-reference-handlers as2-msgs as2-platform-gazebo as2-platform-multirotor-simulator as2-python-api as2-realsense-interface as2-rviz-plugins as2-state-estimator as2-usb-camera-interface as2-visualization ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ as2-alphanumeric-viewer as2-behavior as2-behavior-tree as2-behaviors-motion as2-behaviors-path-planning as2-behaviors-perception as2-behaviors-platform as2-behaviors-trajectory-generation as2-cli as2-core as2-external-object-to-tf as2-gazebo-assets as2-geozones as2-keyboard-teleoperation as2-map-server as2-motion-controller as2-motion-reference-handlers as2-msgs as2-platform-gazebo as2-platform-multirotor-simulator as2-python-api as2-realsense-interface as2-rviz-plugins as2-state-estimator as2-usb-camera-interface as2-visualization ];
  passthru.sources = mkSourceSet (sources: {
    "aerostack2" = substituteSource {
      src = fetchgit {
        name = "aerostack2-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "fdbc3f3bcbb7d9b07e363f5ec7eab8ea48236831";
        hash = "sha256-U6oj9DQ5/QYfFMNMcfkAlhlnC6McsNLss0PB7qBJAZk=";
      };
    };
  });
  meta = {
    description = "Aerostack2 is a ROS2-based framework for the development of autonomous systems for aerial robotics.";
  };
})
