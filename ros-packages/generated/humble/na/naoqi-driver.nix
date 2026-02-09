{
  action-msgs,
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  image-transport,
  kdl-parser,
  mkSourceSet,
  naoqi-bridge-msgs,
  naoqi-libqi,
  naoqi-libqicore,
  rclcpp,
  rclcpp-action,
  robot-state-publisher,
  rosSystemPackages,
  rosidl-default-generators,
  sensor-msgs,
  substituteSource,
  tf2-geometry-msgs,
  tf2-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "naoqi_driver";
  version = "2.1.1-1";
  src = finalAttrs.passthru.sources."naoqi_driver";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs cv-bridge diagnostic-msgs diagnostic-updater geometry-msgs image-transport kdl-parser naoqi-bridge-msgs naoqi-libqi naoqi-libqicore rclcpp rclcpp-action robot-state-publisher sensor-msgs tf2-geometry-msgs tf2-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs cv-bridge diagnostic-msgs diagnostic-updater geometry-msgs image-transport kdl-parser naoqi-bridge-msgs naoqi-libqi naoqi-libqicore rclcpp rclcpp-action robot-state-publisher sensor-msgs tf2-geometry-msgs tf2-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "naoqi_driver" = substituteSource {
      src = fetchgit {
        name = "naoqi_driver-source";
        url = "https://github.com/ros-naoqi/naoqi_driver2-release.git";
        rev = "b7a486d8009c46f800cde7a6db3b536339fdb172";
        hash = "sha256-trLN3h2MQ0/1ooMgCSBmpLIFjrbwKzjN1t0grI54doY=";
      };
    };
  });
  meta = {
    description = "Driver module between Aldebaran's NAOqiOS and ROS2. It publishes all sensor and actuator data as well as basic diagnostic for battery, temperature. It subscribes also to RVIZ simple goal and cmd_vel for teleop.";
  };
})
