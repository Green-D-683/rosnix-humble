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
  pname = "urdfdom_headers";
  version = "1.0.6-2";
  src = finalAttrs.passthru.sources."urdfdom_headers";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "urdfdom_headers" = substituteSource {
      src = fetchgit {
        name = "urdfdom_headers-source";
        url = "https://github.com/ros2-gbp/urdfdom_headers-release.git";
        rev = "65a274bb8736b9ec74a5548474ffde4ea3738589";
        hash = "sha256-FwQz8cyzDFlLKwRPe2ouUp3T2Vbqq6xs8W4QokL1u9U=";
      };
    };
  });
  meta = {
    description = "\n    C++ headers for URDF.\n  ";
  };
})
