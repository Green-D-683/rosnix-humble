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
  pname = "libnabo";
  version = "1.0.7-3";
  src = finalAttrs.passthru.sources."libnabo";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "eigen" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "libnabo" = substituteSource {
      src = fetchgit {
        name = "libnabo-source";
        url = "https://github.com/ros2-gbp/libnabo-release.git";
        rev = "6bfba358356c63e61e6e6ab1dacd541e814b52bc";
        hash = "sha256-Mgrzbissrz6FpDhNnycTc06xxw2+MpwzohUg4wBKVmI=";
      };
    };
  });
  meta = {
    description = "\n		libnabo is a fast K Nearest Neighbour library for low-dimensional spaces.\n	";
  };
})
