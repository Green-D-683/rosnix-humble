{
  ament-cmake-auto,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp-components,
  realsense2-camera,
  ros2launch,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_pro_rgbd_sensors";
  version = "2.13.3-1";
  src = finalAttrs.passthru.sources."tiago_pro_rgbd_sensors";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ ament-index-python diagnostic-updater rclcpp-components realsense2-camera ros2launch ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ ament-index-python diagnostic-updater rclcpp-components realsense2-camera ros2launch ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_pro_rgbd_sensors" = substituteSource {
      src = fetchgit {
        name = "tiago_pro_rgbd_sensors-source";
        url = "https://github.com/ros2-gbp/tiago_pro_navigation-release.git";
        rev = "67e7e3657813a6409d190f8b922f0bb79cb8b61b";
        hash = "sha256-SVpIFWTAyJYRkZhcz6FJLPhXvemRZAGiF6lwnrnUmsg=";
      };
    };
  });
  meta = {
    description = "tiago_pro-specific rgbd sensors launch and config files.";
  };
})
