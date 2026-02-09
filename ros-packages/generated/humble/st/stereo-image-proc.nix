{
  ament-cmake-auto,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-geometry,
  image-proc,
  image-transport,
  launch,
  launch-ros,
  launch-testing,
  launch-testing-ament-cmake,
  message-filters,
  mkSourceSet,
  python-cmake-module,
  rclcpp,
  rclcpp-components,
  rclpy,
  ros-testing,
  rosSystemPackages,
  sensor-msgs,
  stereo-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "stereo_image_proc";
  version = "3.0.9-1";
  src = finalAttrs.passthru.sources."stereo_image_proc";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ cv-bridge image-geometry image-proc image-transport message-filters rclcpp rclcpp-components sensor-msgs stereo-msgs ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ cv-bridge image-geometry image-proc image-transport message-filters rclcpp rclcpp-components sensor-msgs stereo-msgs ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-ros launch-testing launch-testing-ament-cmake python-cmake-module rclpy ros-testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-opencv" ]; };
  passthru.sources = mkSourceSet (sources: {
    "stereo_image_proc" = substituteSource {
      src = fetchgit {
        name = "stereo_image_proc-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "7e4b07649c5436f52f1064f2707ae8e094a34586";
        hash = "sha256-Kplld+A1ZunZQQqxbjzy7uYmPbXznISB/KJL8hShQk8=";
      };
    };
  });
  meta = {
    description = "Stereo and single image rectification and disparity processing.";
  };
})
