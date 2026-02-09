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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_customization";
  version = "1.3.9-1";
  src = finalAttrs.passthru.sources."clearpath_customization";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_customization" = substituteSource {
      src = fetchgit {
        name = "clearpath_customization-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "69ba16fabea6a46d09a681b4dc3d91ccadd69a45";
        hash = "sha256-+07sOlO5wYM9G28n/s0Uolm+QfcXf6bnLwIAPuAdFmg=";
      };
    };
  });
  meta = {
    description = "Clearpath customization packages.";
  };
})
