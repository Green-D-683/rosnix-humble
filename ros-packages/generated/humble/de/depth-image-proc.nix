{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  class-loader,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-geometry,
  image-transport,
  message-filters,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  stereo-msgs,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "depth_image_proc";
  version = "3.0.9-1";
  src = finalAttrs.passthru.sources."depth_image_proc";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ class-loader cv-bridge image-geometry image-transport message-filters rclcpp rclcpp-components sensor-msgs stereo-msgs tf2 tf2-eigen tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" ]; };
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ class-loader cv-bridge image-geometry image-transport message-filters rclcpp rclcpp-components sensor-msgs stereo-msgs tf2 tf2-eigen tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "depth_image_proc" = substituteSource {
      src = fetchgit {
        name = "depth_image_proc-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "503c2aff70d07d9d2ecb500b06ca14f2d4639923";
        hash = "sha256-AbOCi52XqzaMIFyHfdDf4pSf+15cDIq6Neh4ro4voEs=";
      };
    };
  });
  meta = {
    description = "\n\n     Contains components for processing depth images such as those\n     produced by OpenNI camera. Functions include creating disparity\n     images and point clouds, as well as registering (reprojecting)\n     a depth image into another camera frame.\n\n  ";
  };
})
