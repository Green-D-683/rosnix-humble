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
  ros-gz-interfaces,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_ign_interfaces";
  version = "0.244.21-1";
  src = finalAttrs.passthru.sources."ros_ign_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs ros-gz-interfaces rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs ros-gz-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros_ign_interfaces" = substituteSource {
      src = fetchgit {
        name = "ros_ign_interfaces-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "35e5e10d7cb60b8a4643a21127c1da6e6fb90800";
        hash = "sha256-kiYJAExjdHoALFwLDNvExrEKVcms6AsjV3bdAJ0PzVQ=";
      };
    };
  });
  meta = {
    description = "Shim package to redirect to ros_gz_interfaces.";
  };
})
