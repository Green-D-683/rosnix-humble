{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  image-transport,
  launch-ros,
  mkSourceSet,
  nav-msgs,
  pcl-conversions,
  pcl-msgs,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  ros-environment,
  ros2launch,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
  vision-msgs,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "inuros2";
  version = "2.10.15-1";
  src = finalAttrs.passthru.sources."inuros2";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces cv-bridge geometry-msgs image-transport launch-ros nav-msgs pcl-conversions pcl-msgs rclcpp rclcpp-components rclcpp-lifecycle ros2launch ros-environment rosidl-default-runtime sensor-msgs std-msgs vision-msgs yaml-cpp-vendor ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces cv-bridge geometry-msgs image-transport launch-ros nav-msgs pcl-conversions pcl-msgs rclcpp rclcpp-components rclcpp-lifecycle ros2launch ros-environment rosidl-default-runtime sensor-msgs std-msgs vision-msgs yaml-cpp-vendor ];
  passthru.sources = mkSourceSet (sources: {
    "inuros2" = substituteSource {
      src = fetchgit {
        name = "inuros2-source";
        url = "https://bitbucket.org/inuitive/inuros2-release.git";
        rev = "08908fa532a39d4c00ccbac962a8d924a2a681e6";
        hash = "sha256-U/ncJsnbS/dVt/loJ8j2MUkVz5fKLTt/yJh+agOvvAo=";
      };
      substitutions = [
        {
          path = "inucommon/CMakeLists.txt";
          from = "URL https://github.com/google/googletest/archive/refs/tags/release-1.12.1.zip";
          to = "URL ${sources."inuros2/release-1-1"}";
        }
        {
          path = "sdk/CMakeLists.txt";
          from = "URL https://github.com/google/googletest/archive/refs/tags/release-1.12.1.zip";
          to = "URL ${sources."inuros2/release-1-2"}";
        }
      ];
    };
    "inuros2/release-1-1" = substituteSource {
      src = fetchzip {
        name = "release-1-source";
        url = "https://github.com/google/googletest/archive/refs/tags/release-1.12.1.zip";
        hash = "sha256-W+OxRTVtemt2esw4P7IyGWXOonUN5ZuscjvzqkYvZbM=";
      };
    };
    "inuros2/release-1-2" = substituteSource {
      src = fetchzip {
        name = "release-1-source";
        url = "https://github.com/google/googletest/archive/refs/tags/release-1.12.1.zip";
        hash = "sha256-W+OxRTVtemt2esw4P7IyGWXOonUN5ZuscjvzqkYvZbM=";
      };
    };
  });
  meta = {
    description = "Inuitive image publisher";
  };
})
