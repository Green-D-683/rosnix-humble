{
  action-msgs,
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
  trajectory-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "naoqi_bridge_msgs";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."naoqi_bridge_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs geometry-msgs nav-msgs rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs trajectory-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs geometry-msgs nav-msgs rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs trajectory-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "naoqi_bridge_msgs" = substituteSource {
      src = fetchgit {
        name = "naoqi_bridge_msgs-source";
        url = "https://github.com/ros-naoqi/naoqi_bridge_msgs2-release.git";
        rev = "56017993766254f457b37cb7ba0e6536835bd31d";
        hash = "sha256-xdljTAfwNPgy6QtunVz8OO/2cVDUCadY7QMSY4qR1Gc=";
      };
    };
  });
  meta = {
    description = "The naoqi_bridge_msgs package provides custom messages for running Aldebaran's robots in ROS2.";
  };
})
