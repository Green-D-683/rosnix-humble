{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  play-motion2,
  play-motion2-cli,
  rosSystemPackages,
  substituteSource,
  tiago-pro-head-controller-configuration,
  tiago-pro-head-description,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_pro_head_bringup";
  version = "1.7.0-1";
  src = finalAttrs.passthru.sources."tiago_pro_head_bringup";
  nativeBuildInputs = [ ament-cmake-auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ play-motion2 play-motion2-cli tiago-pro-head-controller-configuration tiago-pro-head-description ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ play-motion2 play-motion2-cli tiago-pro-head-controller-configuration tiago-pro-head-description ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_pro_head_bringup" = substituteSource {
      src = fetchgit {
        name = "tiago_pro_head_bringup-source";
        url = "https://github.com/ros2-gbp/tiago_pro_head_robot-release.git";
        rev = "6f31c5c3efa0c1e965a037663132bc57a819ee55";
        hash = "sha256-xOh8/LiwMKCR8tg+AyTSc5iwVlnkx9c0HCEwJIiJG+o=";
      };
    };
  });
  meta = {
    description = "The tiago_pro_head_bringup package";
  };
})
