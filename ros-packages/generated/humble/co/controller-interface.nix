{
  ament-cmake,
  ament-cmake-gen-version-h,
  ament-cmake-gmock,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  hardware-interface,
  mkSourceSet,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "controller_interface";
  version = "2.53.1-1";
  src = finalAttrs.passthru.sources."controller_interface";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedNativeBuildInputs = [ hardware-interface rclcpp-lifecycle sensor-msgs ];
  buildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedBuildInputs = [ hardware-interface rclcpp-lifecycle sensor-msgs ];
  checkInputs = [ ament-cmake-gmock geometry-msgs sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "controller_interface" = substituteSource {
      src = fetchgit {
        name = "controller_interface-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "8a32ed4cdaafff1b6ee90b87f6045defd5b6c7d5";
        hash = "sha256-4HpSfmDK4S2rGw19jfmCEf5c0OLaIAans0suVS9ii5c=";
      };
    };
  });
  meta = {
    description = "Description of controller_interface";
  };
})
