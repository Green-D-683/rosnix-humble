{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "libg2o";
  version = "2020.5.29-4";
  src = finalAttrs.passthru.sources."libg2o";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "opengl" "suitesparse" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "opengl" "suitesparse" ]; };
  passthru.sources = mkSourceSet (sources: {
    "libg2o" = substituteSource {
      src = fetchgit {
        name = "libg2o-source";
        url = "https://github.com/ros2-gbp/libg2o-release.git";
        rev = "116030e56f7241794c9f0a1f0c82f08cdf39b51e";
        hash = "sha256-BJM6q6oL4EdI4Kiv89+V1kr0uXZhGNKBULGxexQn/6w=";
      };
    };
  });
  meta = {
    description = "\n    The libg2o library from http://openslam.org/g2o.html\n  ";
  };
})
