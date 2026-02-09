{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ompl,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mod";
  version = "1.1.1-1";
  src = finalAttrs.passthru.sources."mod";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ompl ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ompl ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mod" = substituteSource {
      src = fetchgit {
        name = "mod-source";
        url = "https://github.com/OrebroUniversity/mod-release.git";
        rev = "94fb1a1c431797911bad37656a854e0a18dfaad7";
        hash = "sha256-LS0LXQAn6KGItu3LXMseE/jpB9UmjFZNEiplseMD4OA=";
      };
    };
  });
  meta = {
    description = "Maps of Dynamics Package";
  };
})
