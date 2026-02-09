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
  pname = "delphi_esr_msgs";
  version = "4.0.0-1";
  src = finalAttrs.passthru.sources."delphi_esr_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces ros-environment rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces ros-environment rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "delphi_esr_msgs" = substituteSource {
      src = fetchgit {
        name = "delphi_esr_msgs-source";
        url = "https://github.com/ros2-gbp/astuff_sensor_msgs-release.git";
        rev = "5950dfd58d344699715d2d895918d3827471aebb";
        hash = "sha256-K7D4wHGenbiq35o06s88bjoKOUdZl3oqIoSabiYN24o=";
      };
    };
  });
  meta = {
    description = "Message definitions for the Delphi ESR";
  };
})
