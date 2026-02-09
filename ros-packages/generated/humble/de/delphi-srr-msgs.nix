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
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "delphi_srr_msgs";
  version = "4.0.0-1";
  src = finalAttrs.passthru.sources."delphi_srr_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces ros-environment rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces ros-environment rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "delphi_srr_msgs" = substituteSource {
      src = fetchgit {
        name = "delphi_srr_msgs-source";
        url = "https://github.com/ros2-gbp/astuff_sensor_msgs-release.git";
        rev = "184f9c4d57e497aaf86d329d1bf657ade79df181";
        hash = "sha256-Vu/trELYAZeFsNU7L9/L1c/gwv48ZdARSjJ1HkujJaU=";
      };
    };
  });
  meta = {
    description = "Message definitions for the Delphi SRR";
  };
})
