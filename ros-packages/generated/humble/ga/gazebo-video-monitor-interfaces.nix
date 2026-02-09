{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gazebo_video_monitor_interfaces";
  version = "0.8.1-1";
  src = finalAttrs.passthru.sources."gazebo_video_monitor_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime std-srvs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-srvs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "gazebo_video_monitor_interfaces" = substituteSource {
      src = fetchgit {
        name = "gazebo_video_monitor_interfaces-source";
        url = "https://github.com/ros2-gbp/gazebo_video_monitors-release.git";
        rev = "6164af169c503cd3b28b619abaac88a9a65c731e";
        hash = "sha256-bAH0auqkiKTCzphiaUV8FZaZ1shqr0qEHf81IBt+SQs=";
      };
    };
  });
  meta = {
    description = "\n    gazebo_video_monitor_interfaces defines interfaces for the gazebo_video_monitor_plugins package.\n  ";
  };
})
