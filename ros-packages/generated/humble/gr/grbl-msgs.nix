{
  action-msgs,
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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "grbl_msgs";
  version = "0.0.2-6";
  src = finalAttrs.passthru.sources."grbl_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "grbl_msgs" = substituteSource {
      src = fetchgit {
        name = "grbl_msgs-source";
        url = "https://github.com/ros2-gbp/grbl_msgs-release.git";
        rev = "0bea5bf1f99ef5cb2d06b96332086fb970eebb6d";
        hash = "sha256-cjvc4arr+Z92IcwzqZryuU4FC2MY+FNpA+6JBe0dhiE=";
      };
    };
  });
  meta = {
    description = "ROS2 Messages package for GRBL devices";
  };
})
