{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "hey5_description";
  version = "3.0.3-1";
  src = finalAttrs.passthru.sources."hey5_description";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ xacro ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "hey5_description" = substituteSource {
      src = fetchgit {
        name = "hey5_description-source";
        url = "https://github.com/pal-gbp/hey5_description-release.git";
        rev = "19b64f032d024f198af590f9217fd2552e737909";
        hash = "sha256-fwL78XqHmvzyBGuSxeUljCaQjHZN3AYNgLJWfWvhBPQ=";
      };
    };
  });
  meta = {
    description = "This package contains the description (mechanical, kinematic, visual,\n    etc.) of the Hey5 hand.  The files in this package are parsed and used by\n    a variety of other components.  Most users will not interact directly\n    with this package.\n  ";
  };
})
