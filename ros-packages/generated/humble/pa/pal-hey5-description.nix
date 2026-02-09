{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pal-urdf-utils,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_hey5_description";
  version = "4.2.0-1";
  src = finalAttrs.passthru.sources."pal_hey5_description";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ pal-urdf-utils xacro ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ pal-urdf-utils xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pal_hey5_description" = substituteSource {
      src = fetchgit {
        name = "pal_hey5_description-source";
        url = "https://github.com/pal-gbp/pal_hey5-release.git";
        rev = "332b878edc34b56390edca5b4c4ccab4ffbce2e6";
        hash = "sha256-rB5xpLiquAFHLGeRavnhVb8Yzb9c3kDoGYSv7amYQso=";
      };
    };
  });
  meta = {
    description = "This package contains the description (mechanical, kinematic, visual,\n    etc.) of the Hey5 hand.  The files in this package are parsed and used by\n    a variety of other components.  Most users will not interact directly\n    with this package.\n  ";
  };
})
