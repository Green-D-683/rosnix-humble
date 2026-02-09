{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ouster_msgs";
  version = "0.4.3-1";
  src = finalAttrs.passthru.sources."ouster_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-generators std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-generators std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ouster_msgs" = substituteSource {
      src = fetchgit {
        name = "ouster_msgs-source";
        url = "https://github.com/ros2-gbp/ros2_ouster_drivers-release.git";
        rev = "521b7a33787c282c8b59d2722b8510a366021419";
        hash = "sha256-KttOu2/DfFMvUIGVwB5shhEWak2NDXx1TYvSGbo/5ZU=";
      };
    };
  });
  meta = {
    description = "ROS2 messages for ouster lidar driver";
  };
})
