{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  psdk-interfaces,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "psdk_wrapper";
  version = "1.3.2-1";
  src = finalAttrs.passthru.sources."psdk_wrapper";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs nav-msgs psdk-interfaces rclcpp rclcpp-lifecycle sensor-msgs std-msgs std-srvs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "ffmpeg-dev" "libopus-dev" "libusb-1.0-dev" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs psdk-interfaces rclcpp rclcpp-lifecycle sensor-msgs std-msgs std-srvs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ffmpeg-dev" "libopus-dev" "libusb-1.0-dev" "nlohmann-json-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "psdk_wrapper" = substituteSource {
      src = fetchgit {
        name = "psdk_wrapper-source";
        url = "https://github.com/ros2-gbp/psdk_ros2-release.git";
        rev = "137207253d47e06133298edac5617bb43610b716";
        hash = "sha256-evplh0M9f7CJSA9eqzSZgR4QKpUXXQfj3IKCU2aCC+Y=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/dji-sdk/Payload-SDK.git";
          to = "URL ${sources."psdk_wrapper/Payload-SDK"}";
        }
      ];
    };
    "psdk_wrapper/Payload-SDK" = substituteSource {
      src = fetchgit {
        name = "Payload-SDK-source";
        url = "https://github.com/dji-sdk/Payload-SDK.git";
        rev = "51d8261d625c88bf6fadc7743025cbfc8fdc1e55";
        hash = "sha256-DLS2c/dA5vxrkrlH3MIfbn6VnwVn3RMEd0qs0Pjx2HQ=";
      };
    };
  });
  meta = {
    description = "ROS2 wrapper for the DJI PSDK";
  };
})
