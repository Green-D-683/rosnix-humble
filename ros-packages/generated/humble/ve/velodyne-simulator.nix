{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  velodyne-description,
  velodyne-gazebo-plugins,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "velodyne_simulator";
  version = "2.0.3-1";
  src = finalAttrs.passthru.sources."velodyne_simulator";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ velodyne-description velodyne-gazebo-plugins ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ velodyne-description velodyne-gazebo-plugins ];
  passthru.sources = mkSourceSet (sources: {
    "velodyne_simulator" = substituteSource {
      src = fetchgit {
        name = "velodyne_simulator-source";
        url = "https://github.com/ros2-gbp/velodyne_simulator-release.git";
        rev = "bf865a75390be66850dba3e25e9ef5f59eea022d";
        hash = "sha256-Cu17nhMENoRv3E5+1HvQyw35oWBdZXPr9BQ3APt4Q0c=";
      };
    };
  });
  meta = {
    description = "\n    Metapackage allowing easy installation of Velodyne simulation components.\n  ";
  };
})
