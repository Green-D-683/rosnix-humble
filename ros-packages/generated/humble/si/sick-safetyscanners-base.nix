{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "sick_safetyscanners_base";
  version = "1.0.3-1";
  src = finalAttrs.passthru.sources."sick_safetyscanners_base";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-chrono-dev" "libboost-system-dev" "libboost-thread-dev" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libboost-chrono-dev" "libboost-system-dev" "libboost-thread-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "sick_safetyscanners_base" = substituteSource {
      src = fetchgit {
        name = "sick_safetyscanners_base-source";
        url = "https://github.com/SICKAG/sick_safetyscanners_base-release.git";
        rev = "efb056e3a8225cc2479b32e8c170e2c954bed8a8";
        hash = "sha256-u+5zBQP6PPEewEWwTz69T2n6FkZutVJfMk+ajxccbcw=";
      };
    };
  });
  meta = {
    description = "Provides an Interface to read the sensor output of a SICK\n  Safety Scanner";
  };
})
