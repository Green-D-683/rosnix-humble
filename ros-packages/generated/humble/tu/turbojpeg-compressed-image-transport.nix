{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turbojpeg_compressed_image_transport";
  version = "0.1.3-1";
  src = finalAttrs.passthru.sources."turbojpeg_compressed_image_transport";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cv-bridge image-transport ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libturbojpeg" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge image-transport ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libturbojpeg" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turbojpeg_compressed_image_transport" = substituteSource {
      src = fetchgit {
        name = "turbojpeg_compressed_image_transport-source";
        url = "https://github.com/ros2-gbp/turbojpeg_compressed_image_transport-release.git";
        rev = "a797d7657e26d53f08814a728ef70844759b8842";
        hash = "sha256-wQ29hHJAn0G7oYS1sPqomyz/MYlPqvthqiK9e0hLN6o=";
      };
    };
  });
  meta = {
    description = "\n    Compressed_image_transport provides a plugin to image_transport for transparently sending images\n    encoded as JPEG by turbojpeg.\n  ";
  };
})
