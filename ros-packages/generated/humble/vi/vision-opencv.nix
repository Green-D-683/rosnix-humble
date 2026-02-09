{
  ament-cmake,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-geometry,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "vision_opencv";
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."vision_opencv";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cv-bridge image-geometry ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge image-geometry ];
  passthru.sources = mkSourceSet (sources: {
    "vision_opencv" = substituteSource {
      src = fetchgit {
        name = "vision_opencv-source";
        url = "https://github.com/ros2-gbp/vision_opencv-release.git";
        rev = "8364932004c41f4adb1aa21eb65acdb98f723557";
        hash = "sha256-epbel3Hxg9Q9tWVLF7QtxHcIVPP8B2wwO3QD9+v+WUw=";
      };
    };
  });
  meta = {
    description = "Packages for interfacing ROS2 with OpenCV, a library of programming functions for real time computer vision.";
  };
})
