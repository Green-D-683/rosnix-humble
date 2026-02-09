{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-geometry,
  image-transport,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rcutils,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tracetools-image-pipeline,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "image_proc";
  version = "3.0.9-1";
  src = finalAttrs.passthru.sources."image_proc";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ cv-bridge image-geometry image-transport rclcpp rclcpp-components rcutils sensor-msgs tracetools-image-pipeline ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" ]; };
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ cv-bridge image-geometry image-transport rclcpp rclcpp-components rcutils sensor-msgs tracetools-image-pipeline ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "image_proc" = substituteSource {
      src = fetchgit {
        name = "image_proc-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "a4f99665b3689320ab6e478446bcaba11ec28559";
        hash = "sha256-YCfiZHxDsbpvVd6JtG9Fy6K3xWY1mqD2r9rIUC6XkUs=";
      };
    };
  });
  meta = {
    description = "Single image rectification and color processing.";
  };
})
