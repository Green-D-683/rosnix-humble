{
  ament-cmake,
  ament-cmake-clang-format,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  joint-state-broadcaster,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "andino_base";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."andino_base";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ controller-manager hardware-interface joint-state-broadcaster pluginlib rclcpp rclcpp-lifecycle ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libgflags-dev" "libserial-dev" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ controller-manager hardware-interface joint-state-broadcaster pluginlib rclcpp rclcpp-lifecycle ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libgflags-dev" "libserial-dev" ]; };
  checkInputs = [ ament-cmake-clang-format ];
  passthru.sources = mkSourceSet (sources: {
    "andino_base" = substituteSource {
      src = fetchgit {
        name = "andino_base-source";
        url = "https://github.com/ros2-gbp/andino-release.git";
        rev = "5e565a06f879bc3331f4bd90613e390b311678ca";
        hash = "sha256-jDwD2kHaXbnNUdHk2/uZaNPck3DSr1dINBcTomWCvcw=";
      };
    };
  });
  meta = {
    description = "The andino_base package";
  };
})
