{
  action-msgs,
  ament-cmake,
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
  pname = "example_interfaces";
  version = "0.9.3-2";
  src = finalAttrs.passthru.sources."example_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "example_interfaces" = substituteSource {
      src = fetchgit {
        name = "example_interfaces-source";
        url = "https://github.com/ros2-gbp/example_interfaces-release.git";
        rev = "7468255a754bdfe48cd595dc3589595b2ed19335";
        hash = "sha256-gXUlSZT2a7gVFcWxxvtf31fEn1FLYvEAVC1agkj8uUA=";
      };
    };
  });
  meta = {
    description = "Contains message and service definitions used by the examples.";
  };
})
