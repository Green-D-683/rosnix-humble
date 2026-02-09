{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  as2-core,
  as2-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "as2_platform_crazyflie";
  version = "1.1.0-3";
  src = finalAttrs.passthru.sources."as2_platform_crazyflie";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ as2-core as2-msgs geometry-msgs nav-msgs rclcpp rclpy sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libusb-1.0" "libusb-1.0-dev" "std_srvs " ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ as2-core as2-msgs geometry-msgs nav-msgs rclcpp rclpy sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libusb-1.0" "libusb-1.0-dev" "std_srvs " ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "as2_platform_crazyflie" = substituteSource {
      src = fetchgit {
        name = "as2_platform_crazyflie-source";
        url = "https://github.com/ros2-gbp/as2_platform_crazyfile-release.git";
        rev = "5cc884d8c796a30c2a325ede90971889c749261a";
        hash = "sha256-H8Z1SEqt9BkQVVjRO/0XDmx83bjwWbrlj3lNdvEHyT0=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/miferco97/crazyflie_cpp.git";
          to = "URL ${sources."as2_platform_crazyflie/crazyflie_cpp"}";
        }
      ];
    };
    "as2_platform_crazyflie/crazyflie_cpp" = substituteSource {
      src = fetchgit {
        name = "crazyflie_cpp-source";
        url = "https://github.com/miferco97/crazyflie_cpp.git";
        rev = "b1aac13077633f7b505ed6c8029d587f18dece70";
        hash = "sha256-2vfisbhvW0JWdVLI+LmCsOe58iYySYlR62HT8S6ziOA=";
      };
      substitutions = [
        {
          path = "crazyflie-link-cpp/tools/build/Findlibusb.cmake";
          from = "DOWNLOAD\n                https://sourceforge.net/projects/libusb/files/libusb-1.0/libusb-\${LIBUSB_WIN_VERSION}/libusb-\${LIBUSB_WIN_VERSION}.7z/download";
          to = "DOWNLOAD file://${sources."as2_platform_crazyflie/crazyflie_cpp/download"}";
        }
      ];
    };
    "as2_platform_crazyflie/crazyflie_cpp/download" = substituteSource {
      src = fetchurl {
        name = "download-source";
        url = "https://sourceforge.net/projects/libusb/files/libusb-1.0/libusb-1.0.24/libusb-1.0.24.7z/download";
        hash = "sha256-sfplupJI4stfBCxK6kL6TwJuGiNVP27TJdkK6rjCe8w=";
      };
    };
  });
  meta = {
    description = "Package to communicate Crazyflie drones with Aerostack2 framework";
  };
})
