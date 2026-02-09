{
  ament-cmake-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "digestible";
  version = "0.1.0-1";
  src = finalAttrs.passthru.sources."digestible";
  nativeBuildInputs = [ ament-cmake-auto ];
  buildInputs = [ ament-cmake-auto ];
  passthru.sources = mkSourceSet (sources: {
    "digestible" = substituteSource {
      src = fetchgit {
        name = "digestible-source";
        url = "https://github.com/tier4/digestible-release.git";
        rev = "97951e829fc5790b3cd62374612b11c351dd797a";
        hash = "sha256-PMDjuy3LYall2oDSaOc/n/0WeBj+t0dG2hzrWie4F1Q=";
      };
    };
  });
  meta = {
    description = "The TIERIV digestible ros vendor package";
  };
})
