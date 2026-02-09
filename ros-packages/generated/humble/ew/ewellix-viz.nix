{
  ament-cmake,
  buildAmentCmakePackage,
  ewellix-description,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ewellix_viz";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."ewellix_viz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ewellix-description rviz2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ewellix-description rviz2 ];
  passthru.sources = mkSourceSet (sources: {
    "ewellix_viz" = substituteSource {
      src = fetchgit {
        name = "ewellix_viz-source";
        url = "https://github.com/clearpath-gbp/ewellix_lift_common-release.git";
        rev = "b67cae28fdc853e68a57408a4b6b338dd5f9d027";
        hash = "sha256-j4R/gHY1OGQxlmI11UXy4p0q7qWu8MAvWLqhTmKjBNk=";
      };
    };
  });
  meta = {
    description = "Clearpath's visualization package for Ewellix TLT lifting columns";
  };
})
