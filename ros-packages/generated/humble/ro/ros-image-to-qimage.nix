{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_image_to_qimage";
  version = "0.2.1-1";
  src = finalAttrs.passthru.sources."ros_image_to_qimage";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cv-bridge sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros_image_to_qimage" = substituteSource {
      src = fetchgit {
        name = "ros_image_to_qimage-source";
        url = "https://github.com/ros2-gbp/ros_image_to_qimage-release.git";
        rev = "6a7a548a3c8984141e6d9714f69be44ece6e484f";
        hash = "sha256-iMqDiWxhiE4eCCykP4aNhTgnJKweSAasczj8BSo2yK8=";
      };
    };
  });
  meta = {
    description = "A package that converts a ros image msg to a qimage object";
  };
})
