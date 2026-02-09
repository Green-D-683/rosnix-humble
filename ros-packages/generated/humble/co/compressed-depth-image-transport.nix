{
  ament-cmake,
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
  pname = "compressed_depth_image_transport";
  version = "2.5.4-1";
  src = finalAttrs.passthru.sources."compressed_depth_image_transport";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cv-bridge image-transport ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge image-transport ];
  passthru.sources = mkSourceSet (sources: {
    "compressed_depth_image_transport" = substituteSource {
      src = fetchgit {
        name = "compressed_depth_image_transport-source";
        url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
        rev = "1961238f73e158c30f5e8d0431b6b5784b055612";
        hash = "sha256-LAd/bJSg0pT0y417CMndseuftPlj00ooua7PG3+qIHc=";
      };
    };
  });
  meta = {
    description = "\n    Compressed_depth_image_transport provides a plugin to image_transport for transparently sending\n    depth images (raw, floating-point) using PNG compression.\n  ";
  };
})
