{
  ament-cmake-auto,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing-ament-cmake,
  mkSourceSet,
  omni-base-description,
  pal-sea-arm-description,
  pal-urdf-utils,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  tiago-pro-head-description,
  urdf-test,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_pro_description";
  version = "1.32.1-1";
  src = finalAttrs.passthru.sources."tiago_pro_description";
  nativeBuildInputs = [ ament-cmake-auto ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ omni-base-description pal-sea-arm-description pal-urdf-utils robot-state-publisher tiago-pro-head-description xacro ];
  buildInputs = [ ament-cmake-auto ament-cmake-python ];
  propagatedBuildInputs = [ omni-base-description pal-sea-arm-description pal-urdf-utils robot-state-publisher tiago-pro-head-description xacro ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch-testing-ament-cmake urdf-test ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_pro_description" = substituteSource {
      src = fetchgit {
        name = "tiago_pro_description-source";
        url = "https://github.com/ros2-gbp/tiago_pro_robot-release.git";
        rev = "e6f0e9359fea23bdd119725b404744ca0c0128d6";
        hash = "sha256-PUVpw6D2UfobTl01j6ts5FZPg6SRtNY6YbqENRmB2HI=";
      };
    };
  });
  meta = {
    description = "The tiago_pro_description package";
  };
})
