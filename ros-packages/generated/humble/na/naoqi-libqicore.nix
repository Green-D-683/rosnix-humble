{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  naoqi-libqi,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "naoqi_libqicore";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."naoqi_libqicore";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ naoqi-libqi ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ naoqi-libqi ];
  passthru.sources = mkSourceSet (sources: {
    "naoqi_libqicore" = substituteSource {
      src = fetchgit {
        name = "naoqi_libqicore-source";
        url = "https://github.com/ros-naoqi/libqicore-release.git";
        rev = "e3e30d7e4d5c784ea1580f30b8359f84ddc194e9";
        hash = "sha256-PXfc+J6QV0X+RlP88zErJ3Lr6lL9DorLKb1oYuD/UI8=";
      };
    };
  });
  meta = {
    description = "Aldebaran's libqicore: a layer on top of libqi";
  };
})
