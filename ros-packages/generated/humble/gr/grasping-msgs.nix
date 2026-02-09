{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  moveit-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  shape-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "grasping_msgs";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."grasping_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs moveit-msgs rosidl-default-generators rosidl-default-runtime sensor-msgs shape-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs moveit-msgs rosidl-default-generators rosidl-default-runtime sensor-msgs shape-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "grasping_msgs" = substituteSource {
      src = fetchgit {
        name = "grasping_msgs-source";
        url = "https://github.com/ros2-gbp/grasping_msgs-release.git";
        rev = "36f13b1f1fd1c4f918a77131231b48fcb956e8a9";
        hash = "sha256-7jkZuQAfwrBxZtca5lsT7W9diA/c+snR1FHkf4JjZoM=";
      };
    };
  });
  meta = {
    description = "\n    Messages for describing objects and how to grasp them.\n  ";
  };
})
