{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-broadcaster,
  joint-trajectory-controller,
  mkSourceSet,
  pal-pro-gripper-controller-configuration,
  pal-pro-gripper-description,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_pro_gripper_bringup";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."pal_pro_gripper_bringup";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ joint-state-broadcaster joint-trajectory-controller pal-pro-gripper-controller-configuration pal-pro-gripper-description ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ joint-state-broadcaster joint-trajectory-controller pal-pro-gripper-controller-configuration pal-pro-gripper-description ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pal_pro_gripper_bringup" = substituteSource {
      src = fetchgit {
        name = "pal_pro_gripper_bringup-source";
        url = "https://github.com/ros2-gbp/pal_pro_gripper-release.git";
        rev = "35acf5c5451d4c74c56a82ab3931a9886f83cca6";
        hash = "sha256-gxoP7USQiwfJdhIDzOpJVVCB2MYKs6jOnHeM3lU8OA8=";
      };
    };
  });
  meta = {
    description = "Launch files to upload the robot description and start the controllers";
  };
})
