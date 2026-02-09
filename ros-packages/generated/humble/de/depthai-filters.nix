{
  ament-cmake-auto,
  buildAmentCmakePackage,
  cv-bridge,
  depthai-ros-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  message-filters,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  vision-msgs,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "depthai_filters";
  version = "2.12.2-1";
  src = finalAttrs.passthru.sources."depthai_filters";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ cv-bridge depthai-ros-msgs image-transport message-filters rclcpp rclcpp-components ros-environment sensor-msgs vision-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" ]; };
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ cv-bridge depthai-ros-msgs image-transport message-filters rclcpp rclcpp-components ros-environment sensor-msgs vision-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "depthai_filters" = substituteSource {
      src = fetchgit {
        name = "depthai_filters-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "476af551fd6b455b3e9fb341abd4a156965de2ca";
        hash = "sha256-6db5gJpJhWzP5AndDNGom+MPz54wU8gwTN4+NwDsWK8=";
      };
    };
  });
  meta = {
    description = "Depthai filters package";
  };
})
