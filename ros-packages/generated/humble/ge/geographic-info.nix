{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geodesy,
  geographic-msgs,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "geographic_info";
  version = "1.0.6-1";
  src = finalAttrs.passthru.sources."geographic_info";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geodesy geographic-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geodesy geographic-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "geographic_info" = substituteSource {
      src = fetchgit {
        name = "geographic_info-source";
        url = "https://github.com/ros2-gbp/geographic_info-release.git";
        rev = "ec36cdf23aea940117b32f682a98e83e889cc848";
        hash = "sha256-9v0PhFwY4GRy9FH7XCYu+48GcNisf9Hg2093eaFWEKU=";
      };
    };
  });
  meta = {
    description = "\n    Geographic information metapackage.\n\n    Not needed for wet packages, use only to resolve dry stack\n    dependencies.\n  ";
  };
})
