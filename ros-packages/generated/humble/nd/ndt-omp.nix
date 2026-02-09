{
  ament-cmake-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ndt_omp";
  version = "0.0.0-1";
  src = finalAttrs.passthru.sources."ndt_omp";
  nativeBuildInputs = [ ament-cmake-auto ros-environment ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libpcl-all-dev" ]; };
  buildInputs = [ ament-cmake-auto ros-environment ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libpcl-all-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ndt_omp" = substituteSource {
      src = fetchgit {
        name = "ndt_omp-source";
        url = "https://github.com/ros2-gbp/ndt_omp-release.git";
        rev = "6ee173549b9d1911a99ce79bcce08dfc4be67b99";
        hash = "sha256-i0VwuoqswFc1coII78CBoR1ZGHshFFuKNQgVzS5LC/c=";
      };
    };
  });
  meta = {
    description = "OpenMP boosted NDT and GICP algorithms";
  };
})
