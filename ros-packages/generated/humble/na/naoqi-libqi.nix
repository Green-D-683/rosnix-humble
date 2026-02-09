{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "naoqi_libqi";
  version = "3.0.2-1";
  src = finalAttrs.passthru.sources."naoqi_libqi";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "libssl-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libssl-dev" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "naoqi_libqi" = substituteSource {
      src = fetchgit {
        name = "naoqi_libqi-source";
        url = "https://github.com/ros-naoqi/libqi-release.git";
        rev = "cb2b38907701199d4035aac6aecc8925d44edf51";
        hash = "sha256-AG0mf99fX20ie4x2S5JFrLncF7PtLXVNplRcDjOXMUI=";
      };
    };
  });
  meta = {
    description = "Aldebaran's libqi: a core library for NAOqiOS development";
  };
})
