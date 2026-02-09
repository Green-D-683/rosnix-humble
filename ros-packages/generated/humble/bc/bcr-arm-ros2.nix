{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
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
  pname = "bcr_arm_ros2";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."bcr_arm_ros2";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ bcr-arm-description bcr-arm-gazebo bcr-arm-moveit-config ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ bcr-arm-description bcr-arm-gazebo bcr-arm-moveit-config ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "bcr_arm_ros2" = substituteSource {
      src = fetchgit {
        name = "bcr_arm_ros2-source";
        url = "https://github.com/ros2-gbp/bcr_arm-release.git";
        rev = "2e2c28eee37feb95d8c3a7f7bd0d79cb23893d9f";
        hash = "sha256-i3e0dFJUuTJ3d2OlY1nVgxUAMnc3Okum37n2h12PwVI=";
      };
    };
  });
  meta = {
    description = "TODO: Package description (metapackage)";
  };
})
