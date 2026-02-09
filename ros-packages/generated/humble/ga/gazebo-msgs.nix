{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
  trajectory-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gazebo_msgs";
  version = "3.9.0-1";
  src = finalAttrs.passthru.sources."gazebo_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs trajectory-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs trajectory-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "gazebo_msgs" = substituteSource {
      src = fetchgit {
        name = "gazebo_msgs-source";
        url = "https://github.com/ros2-gbp/gazebo_ros_pkgs-release.git";
        rev = "3d2d68c8fc30072dac4f27822b8a714abd4f870d";
        hash = "sha256-cXzSpCOP8C+H/L+lsblvGHA4Tks9hKL4yBqwBW9ewO8=";
      };
    };
  });
  meta = {
    description = "\n    Message and service data structures for interacting with Gazebo from ROS2.\n  ";
  };
})
