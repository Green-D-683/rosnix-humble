{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  compressed-depth-image-transport,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-geometry,
  image-transport,
  mkSourceSet,
  pcl-conversions,
  pcl-ros,
  ros2launch,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "adi_3dtof_image_stitching";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."adi_3dtof_image_stitching";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ compressed-depth-image-transport cv-bridge image-geometry image-transport pcl-conversions pcl-ros ros2launch sensor-msgs std-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ compressed-depth-image-transport cv-bridge image-geometry image-transport pcl-conversions pcl-ros ros2launch sensor-msgs std-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "adi_3dtof_image_stitching" = substituteSource {
      src = fetchgit {
        name = "adi_3dtof_image_stitching-source";
        url = "https://github.com/ros2-gbp/adi_3dtof_image_stitching-release.git";
        rev = "64169744fd172742d9edaf6c0f87301522432adb";
        hash = "sha256-bsmq3hf2IQKXv8Kul5pwmtKPKAHn+wi0dZ0JuY0STrA=";
      };
    };
  });
  meta = {
    description = "The adi_3dtof_image_stitching package";
  };
})
