{
  ament-cmake,
  buildAmentCmakePackage,
  costmap-queue,
  dwb-core,
  dwb-critics,
  dwb-msgs,
  dwb-plugins,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav-2d-msgs,
  nav-2d-utils,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_dwb_controller";
  version = "1.1.20-1";
  src = finalAttrs.passthru.sources."nav2_dwb_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ costmap-queue dwb-core dwb-critics dwb-msgs dwb-plugins nav-2d-msgs nav-2d-utils ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ costmap-queue dwb-core dwb-critics dwb-msgs dwb-plugins nav-2d-msgs nav-2d-utils ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_dwb_controller" = substituteSource {
      src = fetchgit {
        name = "nav2_dwb_controller-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "651b175351d4f0f13cf989a963eda5389cfeffce";
        hash = "sha256-/LkTYAZsvxaxeTra4f1q1VeMXw82SEZ2FHgfbvnm3hw=";
      };
    };
  });
  meta = {
    description = "\n    ROS2 controller (DWB) metapackage\n  ";
  };
})
