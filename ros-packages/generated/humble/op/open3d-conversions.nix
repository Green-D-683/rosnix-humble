{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "open3d_conversions";
  version = "0.2.1-1";
  src = finalAttrs.passthru.sources."open3d_conversions";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libopen3d-dev" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libopen3d-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "open3d_conversions" = substituteSource {
      src = fetchgit {
        name = "open3d_conversions-source";
        url = "https://github.com/ros2-gbp/perception_open3d-release.git";
        rev = "abb156ecaeea530e1827480b0aa5245736087e3b";
        hash = "sha256-2yLd7YouJNPhz5sMosuBimTluyfrkn3i5GnxpgpaLeQ=";
      };
    };
  });
  meta = {
    description = "Provides conversion functions to and from Open3D datatypes";
  };
})
