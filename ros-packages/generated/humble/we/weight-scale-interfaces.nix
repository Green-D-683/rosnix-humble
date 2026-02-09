{
  action-msgs,
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
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "weight_scale_interfaces";
  version = "0.0.3-1";
  src = finalAttrs.passthru.sources."weight_scale_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "weight_scale_interfaces" = substituteSource {
      src = fetchgit {
        name = "weight_scale_interfaces-source";
        url = "https://github.com/TechMagicKK/weight_scale_interfaces-release.git";
        rev = "261f0e54629bfadb0f11907d4505ed87aee82832";
        hash = "sha256-UffYvB7Pv+rxqDHcSNdSdraluaYkYXWtfljQlu7HDCc=";
      };
    };
  });
  meta = {
    description = "Definition of the interface for weight scale devices";
  };
})
