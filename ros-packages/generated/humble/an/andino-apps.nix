{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  andino-gz-classic,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav2-bringup,
  ros2launch,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "andino_apps";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."andino_apps";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ andino-gz-classic nav2-bringup ros2launch rviz2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ andino-gz-classic nav2-bringup ros2launch rviz2 ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "andino_apps" = substituteSource {
      src = fetchgit {
        name = "andino_apps-source";
        url = "https://github.com/ros2-gbp/andino-release.git";
        rev = "c030fb6741b496dd776bf81881ca8f9ae7ff54de";
        hash = "sha256-6mZTQTwnyGMiJNnRCiU5JZWiqRxMC7nae35xTp9dNcQ=";
      };
    };
  });
  meta = {
    description = "Package for apps created with andino";
  };
})
