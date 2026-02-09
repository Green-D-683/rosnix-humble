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
  pname = "agnocast_sample_interfaces";
  version = "2.1.2-1";
  src = finalAttrs.passthru.sources."agnocast_sample_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "agnocast_sample_interfaces" = substituteSource {
      src = fetchgit {
        name = "agnocast_sample_interfaces-source";
        url = "https://github.com/ros2-gbp/agnocast-release.git";
        rev = "f9b0d155184b186f10ad61c80e382a1c935d829a";
        hash = "sha256-DWqIVPMzotym5JIkVSVlHj1P+xMPunu52w1pNjK8Uro=";
      };
    };
  });
  meta = {
    description = "\n    Sample interfaces for the Agnocast sample application.\n  ";
  };
})
