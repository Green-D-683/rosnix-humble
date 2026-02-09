{
  ament-cmake,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rot_conv";
  version = "1.0.11-2";
  src = finalAttrs.passthru.sources."rot_conv";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rot_conv" = substituteSource {
      src = fetchgit {
        name = "rot_conv-source";
        url = "https://github.com/ros2-gbp/rot_conv_lib-release.git";
        rev = "e793af8fd25bf694648d7b8e11490252c3b848ff";
        hash = "sha256-6/6mfqRarCEYQCMc18m5vFDCS0UjiBqGWsoHUEB7LiU=";
      };
    };
  });
  meta = {
    description = "A collection of functions that address common computations and numerical handling of rotations in 3D Euclidean space";
  };
})
