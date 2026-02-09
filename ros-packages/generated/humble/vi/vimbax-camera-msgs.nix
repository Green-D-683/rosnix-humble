{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
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
  pname = "vimbax_camera_msgs";
  version = "1.0.2-1";
  src = finalAttrs.passthru.sources."vimbax_camera_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "vimbax_camera_msgs" = substituteSource {
      src = fetchgit {
        name = "vimbax_camera_msgs-source";
        url = "https://github.com/ros2-gbp/vimbax_ros2_driver-release.git";
        rev = "a9cc716745e89ec6d103a6f146a1b4145f7d5d29";
        hash = "sha256-3JNWRjKihj2jf7JtNIeF29yP1L7UJ3Z8EG6kDpN2zpg=";
      };
    };
  });
  meta = {
    description = "Topic and Service definitions used by the vimbax_camera_node";
  };
})
