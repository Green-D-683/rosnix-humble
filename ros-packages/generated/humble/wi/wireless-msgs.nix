{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
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
  pname = "wireless_msgs";
  version = "1.1.5-2";
  src = finalAttrs.passthru.sources."wireless_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "wireless_msgs" = substituteSource {
      src = fetchgit {
        name = "wireless_msgs-source";
        url = "https://github.com/clearpath-gbp/wireless-release.git";
        rev = "d5fd99f57c958213a140ed5c9fae4588ed1ca01e";
        hash = "sha256-kA7n73VCLUVBvZ/zmWwbOnLWg66vOuyneJ9Gw8G2poA=";
      };
    };
  });
  meta = {
    description = "Messages for describing a wireless network such as bitrate, essid, and link quality.";
  };
})
