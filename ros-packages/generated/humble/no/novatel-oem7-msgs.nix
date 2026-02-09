{
  ament-cmake,
  buildColconPackage,
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
buildColconPackage (finalAttrs: {
  pname = "novatel_oem7_msgs";
  version = "20.8.0-1";
  src = finalAttrs.passthru.sources."novatel_oem7_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "novatel_oem7_msgs" = substituteSource {
      src = fetchgit {
        name = "novatel_oem7_msgs-source";
        url = "https://github.com/novatel-gbp/novatel_oem7_driver-release.git";
        rev = "00664fbae047ae4c25d924b0d6a20b92f9674a00";
        hash = "sha256-ej1ftvEpLMe+8gKhR5GzVNy8DdhtZMRhOUNOeo2atE4=";
      };
    };
  });
  meta = {
    description = "\n      Messages for NovAtel Oem7 family of receivers.\n  ";
  };
})
