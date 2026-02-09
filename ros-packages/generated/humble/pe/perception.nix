{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  image-common,
  image-pipeline,
  image-transport-plugins,
  laser-filters,
  laser-geometry,
  mkSourceSet,
  perception-pcl,
  ros-base,
  rosSystemPackages,
  substituteSource,
  vision-opencv,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "perception";
  version = "0.10.0-1";
  src = finalAttrs.passthru.sources."perception";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ image-common image-pipeline image-transport-plugins laser-filters laser-geometry perception-pcl ros-base vision-opencv ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ image-common image-pipeline image-transport-plugins laser-filters laser-geometry perception-pcl ros-base vision-opencv ];
  passthru.sources = mkSourceSet (sources: {
    "perception" = substituteSource {
      src = fetchgit {
        name = "perception-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "2e16118c7eee6c0b31314b2f6d406449687a0e5f";
        hash = "sha256-c9lGVLwPCuMSbgiHggs37sSu7II5YKdn0ruTBwk2wMs=";
      };
    };
  });
  meta = {
    description = "A package which aggregates common perception packages.";
  };
})
