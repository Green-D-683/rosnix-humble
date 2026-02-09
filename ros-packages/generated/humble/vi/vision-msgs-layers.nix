{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rqt-image-overlay-layer,
  substituteSource,
  vision-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "vision_msgs_layers";
  version = "0.1.0-1";
  src = finalAttrs.passthru.sources."vision_msgs_layers";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rqt-image-overlay-layer vision-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rqt-image-overlay-layer vision-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "vision_msgs_layers" = substituteSource {
      src = fetchgit {
        name = "vision_msgs_layers-source";
        url = "https://github.com/ros2-gbp/vision_msgs_layers-release.git";
        rev = "c64c4ca97583e1ab6c88fbf684509da0a455a658";
        hash = "sha256-9W1+3cqmKRRcPA7B/3CZRu9TEpO7FvqXZdO/pL9M79o=";
      };
    };
  });
  meta = {
    description = "Collection of RQt Image Overlay Plugins for Vision Msgs";
  };
})
