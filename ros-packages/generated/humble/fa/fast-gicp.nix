{
  ament-cmake,
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
  pname = "fast_gicp";
  version = "0.0.0-1";
  src = finalAttrs.passthru.sources."fast_gicp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libpcl-all-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libpcl-all-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "fast_gicp" = substituteSource {
      src = fetchgit {
        name = "fast_gicp-source";
        url = "https://github.com/ros2-gbp/fast_gicp-release.git";
        rev = "2df9bd9c735513ed193ce6b27f8851ee01245a67";
        hash = "sha256-NaIYVgSEOGUwgQ/LKzFWxJjrm93GH0Mp7cW2JZiQn/U=";
      };
    };
  });
  meta = {
    description = "A collection of fast point cloud registration implementations";
  };
})
