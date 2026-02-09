{
  ament-cmake-ros,
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
  pname = "vmbc_interface";
  version = "1.0.2-1";
  src = finalAttrs.passthru.sources."vmbc_interface";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rclcpp ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "vmbc_interface" = substituteSource {
      src = fetchgit {
        name = "vmbc_interface-source";
        url = "https://github.com/ros2-gbp/vimbax_ros2_driver-release.git";
        rev = "aa4fb2be68356bedabfcf1c9eec24264174a8d65";
        hash = "sha256-mey/u1w1VIsYjxeRgyoVmubSXKNwfw8XSiR5bOw1wEs=";
      };
    };
  });
  meta = {
    description = "VmbC interface package";
  };
})
