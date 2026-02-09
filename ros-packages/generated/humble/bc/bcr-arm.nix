{
  ament-cmake,
  bcr-arm-description,
  bcr-arm-gazebo,
  bcr-arm-moveit-config,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "bcr_arm";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."bcr_arm";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ bcr-arm-description bcr-arm-gazebo bcr-arm-moveit-config ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ bcr-arm-description bcr-arm-gazebo bcr-arm-moveit-config ];
  passthru.sources = mkSourceSet (sources: {
    "bcr_arm" = substituteSource {
      src = fetchgit {
        name = "bcr_arm-source";
        url = "https://github.com/ros2-gbp/bcr_arm-release.git";
        rev = "b8124f2aae33bcbb8953b3098d949cda911d3e03";
        hash = "sha256-rt/Uf6bh0AVKOugUIZOl/rA2680P133T0Ob91hkc0Jg=";
      };
    };
  });
  meta = {
    description = "Metapackage for the BCR Arm robot stack";
  };
})
