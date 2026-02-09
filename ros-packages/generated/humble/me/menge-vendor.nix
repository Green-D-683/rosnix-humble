{
  ament-cmake,
  buildCatkinPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCatkinPackage (finalAttrs: {
  pname = "menge_vendor";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."menge_vendor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" "tinyxml" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" "tinyxml" ]; };
  passthru.sources = mkSourceSet (sources: {
    "menge_vendor" = substituteSource {
      src = fetchgit {
        name = "menge_vendor-source";
        url = "https://github.com/ros2-gbp/menge_vendor-release.git";
        rev = "9c772d1d16a12bb92f0fb7c9658793c2b912f8cf";
        hash = "sha256-+mE+NkGEuPh8fHQwcx0MX0DYlVwGrbAGCbKply1Zrmg=";
      };
    };
  });
  meta = {
    description = "Menge is a powerful, cross-platform, modular framework for crowd simulation developed at the University of North Carolina - Chapel Hill. This package includes the core simulation part of origin menge package, with a bit modification for crowd simulation in gazebo and ignition gazebo.\n  ";
  };
})
