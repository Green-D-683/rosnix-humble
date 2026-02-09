{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-pal,
  mkSourceSet,
  nav2-bringup,
  pal-navigation-cfg-params,
  ros2launch,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_navigation_cfg_bringup";
  version = "3.0.6-1";
  src = finalAttrs.passthru.sources."pal_navigation_cfg_bringup";
  nativeBuildInputs = [ ament-cmake-auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch-pal nav2-bringup pal-navigation-cfg-params ros2launch ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ launch-pal nav2-bringup pal-navigation-cfg-params ros2launch ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pal_navigation_cfg_bringup" = substituteSource {
      src = fetchgit {
        name = "pal_navigation_cfg_bringup-source";
        url = "https://github.com/pal-gbp/pal_navigation_cfg_public-release.git";
        rev = "6b3216e2f568f7145ea745ebb73a9a8a2ed3a3e7";
        hash = "sha256-M9h9+zc9Xd3HJ50cgGYL0HK+HY/iFraBFcvBa850D6M=";
      };
    };
  });
  meta = {
    description = "Central storage of PAL Navigation launch files";
  };
})
