{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "agnocast_ioctl_wrapper";
  version = "2.1.2-1";
  src = finalAttrs.passthru.sources."agnocast_ioctl_wrapper";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "agnocast_ioctl_wrapper" = substituteSource {
      src = fetchgit {
        name = "agnocast_ioctl_wrapper-source";
        url = "https://github.com/ros2-gbp/agnocast-release.git";
        rev = "4db639a0afe80f8daee31a771d110d5d1de7abd1";
        hash = "sha256-L6JdTYxBf728PB9VHN4CUtoLgkpssiF2D8Tx3nHd8O0=";
      };
    };
  });
  meta = {
    description = "\n    The wrapper of ioctl for command line tool extension for Agnocast.\n  ";
  };
})
