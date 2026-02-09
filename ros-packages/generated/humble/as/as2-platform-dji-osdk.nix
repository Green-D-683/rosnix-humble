{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
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
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "as2_platform_dji_osdk";
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."as2_platform_dji_osdk";
  propagatedNativeBuildInputs = [ ament-cmake ament-index-cpp as2-core as2-msgs geometry-msgs nav-msgs rclcpp sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libusb-1.0-dev" "std_srvs " ]; };
  propagatedBuildInputs = [ ament-cmake ament-index-cpp as2-core as2-msgs geometry-msgs nav-msgs rclcpp sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libusb-1.0-dev" "std_srvs " ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "as2_platform_dji_osdk" = substituteSource {
      src = fetchgit {
        name = "as2_platform_dji_osdk-source";
        url = "https://github.com/ros2-gbp/as2_platform_dji_osdk-release.git";
        rev = "673f3f097533897b89182b9660bea929992f838b";
        hash = "sha256-EsCdgui86kGkTIvlez+R1X5Rh1Tr7nLZkthphzw9E54=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/aerostack2/Onboard-SDK.git";
          to = "URL ${sources."as2_platform_dji_osdk/Onboard-SDK"}";
        }
      ];
    };
    "as2_platform_dji_osdk/Onboard-SDK" = substituteSource {
      src = fetchgit {
        name = "Onboard-SDK-source";
        url = "https://github.com/aerostack2/Onboard-SDK.git";
        rev = "0c4906b8341461835424a2ab87042d90fcf829bd";
        hash = "sha256-xzHCT8UGsXMVt8GqAy89wYIpichGkbqPSPfkzwpvg44=";
      };
      substitutions = [
        {
          path = "osdk-core/advanced-sensing/ori-osdk-core/cmake-modules/External_AdvancedSensing.cmake";
          from = "GIT_REPOSITORY https://github.com/dji-sdk/Onboard-SDK-Resources.git";
          to = "URL ${sources."as2_platform_dji_osdk/Onboard-SDK/Onboard-SDK-Resources-1"}";
        }
        {
          path = "osdk-core/advanced-sensing/ori-osdk-core/cmake-modules/External_WaypointV2Core.cmake";
          from = "GIT_REPOSITORY https://github.com/dji-sdk/Onboard-SDK-Resources.git";
          to = "URL ${sources."as2_platform_dji_osdk/Onboard-SDK/Onboard-SDK-Resources-2"}";
        }
        {
          path = "osdk-core/cmake-modules/External_AdvancedSensing.cmake";
          from = "GIT_REPOSITORY https://github.com/dji-sdk/Onboard-SDK-Resources.git";
          to = "URL ${sources."as2_platform_dji_osdk/Onboard-SDK/Onboard-SDK-Resources-3"}";
        }
        {
          path = "osdk-core/cmake-modules/External_WaypointV2Core.cmake";
          from = "GIT_REPOSITORY https://github.com/dji-sdk/Onboard-SDK-Resources.git";
          to = "URL ${sources."as2_platform_dji_osdk/Onboard-SDK/Onboard-SDK-Resources-4"}";
        }
      ];
    };
    "as2_platform_dji_osdk/Onboard-SDK/Onboard-SDK-Resources-1" = substituteSource {
      src = fetchgit {
        name = "Onboard-SDK-Resources-source";
        url = "https://github.com/dji-sdk/Onboard-SDK-Resources.git";
        rev = "d8a611bbe19e87e0a7ab0fd2ba3789225e01e025";
        hash = "sha256-ZdXCAnHZKWqZkL3byOH6HdY5WMK5zLB7xDZG22Xeiuc=";
      };
    };
    "as2_platform_dji_osdk/Onboard-SDK/Onboard-SDK-Resources-2" = substituteSource {
      src = fetchgit {
        name = "Onboard-SDK-Resources-source";
        url = "https://github.com/dji-sdk/Onboard-SDK-Resources.git";
        rev = "18044c5cce6745b65b6a5d09f9d1a109ad072a57";
        hash = "sha256-zoJNS0B8RsHBQ/FxnNc+h45ymUb2HM3E2DEJl28j1jY=";
      };
    };
    "as2_platform_dji_osdk/Onboard-SDK/Onboard-SDK-Resources-3" = substituteSource {
      src = fetchgit {
        name = "Onboard-SDK-Resources-source";
        url = "https://github.com/dji-sdk/Onboard-SDK-Resources.git";
        rev = "d8a611bbe19e87e0a7ab0fd2ba3789225e01e025";
        hash = "sha256-ZdXCAnHZKWqZkL3byOH6HdY5WMK5zLB7xDZG22Xeiuc=";
      };
    };
    "as2_platform_dji_osdk/Onboard-SDK/Onboard-SDK-Resources-4" = substituteSource {
      src = fetchgit {
        name = "Onboard-SDK-Resources-source";
        url = "https://github.com/dji-sdk/Onboard-SDK-Resources.git";
        rev = "18044c5cce6745b65b6a5d09f9d1a109ad072a57";
        hash = "sha256-zoJNS0B8RsHBQ/FxnNc+h45ymUb2HM3E2DEJl28j1jY=";
      };
    };
  });
  meta = {
    description = "Package to communicate DJI OSDK with Aerostack2 framework";
  };
})
