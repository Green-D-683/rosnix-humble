{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pal-pro-gripper-controller-configuration,
  pal-pro-gripper-description,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_pro_gripper";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."pal_pro_gripper";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ pal-pro-gripper-controller-configuration pal-pro-gripper-description ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pal-pro-gripper-controller-configuration pal-pro-gripper-description ];
  passthru.sources = mkSourceSet (sources: {
    "pal_pro_gripper" = substituteSource {
      src = fetchgit {
        name = "pal_pro_gripper-source";
        url = "https://github.com/ros2-gbp/pal_pro_gripper-release.git";
        rev = "fe4e6135c7df5a3bf797b7969aa20c19725889de";
        hash = "sha256-hqLuHSgKW17+NXtrvBV6lEC9TV/B+7X7BLvYrNCCR0E=";
      };
    };
  });
  meta = {
    description = "The pal_pro_gripper package";
  };
})
