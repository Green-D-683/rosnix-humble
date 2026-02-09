{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qb_device_msgs";
  version = "4.1.3-1";
  src = finalAttrs.passthru.sources."qb_device_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs std-srvs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "qb_device_msgs" = substituteSource {
      src = fetchgit {
        name = "qb_device_msgs-source";
        url = "https://bitbucket.org/qbrobotics/qbdevice-ros2-release.git";
        rev = "1b8deddab54cadf0fc1db339728337a626ebcb33";
        hash = "sha256-1u6q1Q3om7xdWhEQMztTZHFaeepcFvRdfmA8pV5IErM=";
      };
    };
  });
  meta = {
    description = "\n    This package contains the device-independent custom ROS messages for qbrobotics® devices.\n  ";
  };
})
