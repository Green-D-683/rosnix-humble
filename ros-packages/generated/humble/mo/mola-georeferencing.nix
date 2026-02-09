{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtsam,
  mkSourceSet,
  mola-common,
  mola-gtsam-factors,
  mola-yaml,
  mp2p-icp,
  mrpt-libmaps,
  mrpt-libtclap,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_georeferencing";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."mola_georeferencing";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gtsam mola-common mola-gtsam-factors mola-yaml mp2p-icp mrpt-libmaps mrpt-libtclap ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gtsam mola-common mola-gtsam-factors mola-yaml mp2p-icp mrpt-libmaps mrpt-libtclap ];
  passthru.sources = mkSourceSet (sources: {
    "mola_georeferencing" = substituteSource {
      src = fetchgit {
        name = "mola_georeferencing-source";
        url = "https://github.com/ros2-gbp/mola_state_estimation-release.git";
        rev = "2ace2834c599baef5bbe4489db120f82831e908f";
        hash = "sha256-cZjQ1UNPvm77YbCL3hB2oKPAgvsfcdFZbiol+KM5VwY=";
      };
    };
  });
  meta = {
    description = "C++ library for georeferencing key-frame maps (simplemaps) and related CLI tools";
  };
})
