{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  slam-toolbox,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "andino_slam";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."andino_slam";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ slam-toolbox ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ slam-toolbox ];
  passthru.sources = mkSourceSet (sources: {
    "andino_slam" = substituteSource {
      src = fetchgit {
        name = "andino_slam-source";
        url = "https://github.com/ros2-gbp/andino-release.git";
        rev = "a5a2e0ae6b7280379447016528500e646c14d3e5";
        hash = "sha256-hLOP2EGxqosHRA+ZaZSXrIjlPD/mYktvbozMJnigAvw=";
      };
    };
  });
  meta = {
    description = "The andino_slam package";
  };
})
