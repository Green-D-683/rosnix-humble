{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  camera-calibration-parsers,
  camera-info-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "image_common";
  version = "3.1.12-1";
  src = finalAttrs.passthru.sources."image_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ camera-calibration-parsers camera-info-manager image-transport ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ camera-calibration-parsers camera-info-manager image-transport ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "image_common" = substituteSource {
      src = fetchgit {
        name = "image_common-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "c03bd68d17afd85e44907b0451efe3bdb628a681";
        hash = "sha256-pQKtCjlCr5vVTM8M5UvWjvQgSjrGLfi0nvfahvocjzs=";
      };
    };
  });
  meta = {
    description = "Common code for working with images in ROS.";
  };
})
