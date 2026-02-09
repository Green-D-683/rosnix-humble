{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "robot_controllers_msgs";
  version = "0.9.3-1";
  src = finalAttrs.passthru.sources."robot_controllers_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "robot_controllers_msgs" = substituteSource {
      src = fetchgit {
        name = "robot_controllers_msgs-source";
        url = "https://github.com/fetchrobotics-gbp/robot_controllers-ros2-release.git";
        rev = "c87a19cec79fdb3b63170dd9fda11b7e0a93ae23";
        hash = "sha256-utKROZ18GIYSRr1eO7wR5SHfPu2qKiX38fAMIqeqwwo=";
      };
    };
  });
  meta = {
    description = "\n    Messages for use with robot_controllers framework.\n  ";
  };
})
