{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pal-sea-arm-gazebo,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_sea_arm_simulation";
  version = "1.0.4-1";
  src = finalAttrs.passthru.sources."pal_sea_arm_simulation";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ pal-sea-arm-gazebo ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pal-sea-arm-gazebo ];
  passthru.sources = mkSourceSet (sources: {
    "pal_sea_arm_simulation" = substituteSource {
      src = fetchgit {
        name = "pal_sea_arm_simulation-source";
        url = "https://github.com/ros2-gbp/pal_sea_arm_simulation-release.git";
        rev = "a0d23a57c0dc730dff06c5e7dd0b80515b324028";
        hash = "sha256-go/OdoPxqvGAUQQpBsyhbnHR7lK6uOcZHFnGPBVkleY=";
      };
    };
  });
  meta = {
    description = "The pal_sea_arm_simulation package";
  };
})
