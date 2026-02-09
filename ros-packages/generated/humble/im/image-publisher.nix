{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  camera-info-manager,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rcl-interfaces,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "image_publisher";
  version = "3.0.9-1";
  src = finalAttrs.passthru.sources."image_publisher";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ camera-info-manager cv-bridge image-transport rcl-interfaces rclcpp rclcpp-components ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ camera-info-manager cv-bridge image-transport rcl-interfaces rclcpp rclcpp-components ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "image_publisher" = substituteSource {
      src = fetchgit {
        name = "image_publisher-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "e5f3447101ca57ba6bc1d18a6cd075b9a41f8092";
        hash = "sha256-DomwzaA3sNay7oxXmT3Vf31QOsG/4ypso/jv0s2pac0=";
      };
    };
  });
  meta = {
    description = "\n\n      Contains a node publish an image stream from single image file\n      or avi motion file.\n\n  ";
  };
})
