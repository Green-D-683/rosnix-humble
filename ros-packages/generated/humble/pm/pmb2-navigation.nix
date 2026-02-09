{
  ament-cmake-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pmb2-2dnav,
  pmb2-laser-sensors,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pmb2_navigation";
  version = "4.18.2-1";
  src = finalAttrs.passthru.sources."pmb2_navigation";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ pmb2-2dnav pmb2-laser-sensors ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ pmb2-2dnav pmb2-laser-sensors ];
  passthru.sources = mkSourceSet (sources: {
    "pmb2_navigation" = substituteSource {
      src = fetchgit {
        name = "pmb2_navigation-source";
        url = "https://github.com/pal-gbp/pmb2_navigation-gbp.git";
        rev = "d2507d100aaff56894827f7c80106f862af12d8d";
        hash = "sha256-wP+/ngoxOHKym7Ge3jZhXF2AbBtSGYx553b0jcDVOAM=";
      };
    };
  });
  meta = {
    description = "PMB2 navigation metapackage";
  };
})
