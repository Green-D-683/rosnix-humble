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
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cob_srvs";
  version = "2.7.10-1";
  src = finalAttrs.passthru.sources."cob_srvs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cob_srvs" = substituteSource {
      src = fetchgit {
        name = "cob_srvs-source";
        url = "https://github.com/4am-robotics/cob_common-release.git";
        rev = "02b406c887e817af0d57df6dc634d52ad1e29c16";
        hash = "sha256-kiRpPYJCEpnNvmO79HB5AcPt9BX4M8cASoOgUl16Elw=";
      };
    };
  });
  meta = {
    description = "This Package contains Care-O-bot specific service definitions.";
  };
})
