{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-ros,
  mkSourceSet,
  nav2-bringup,
  navigation2,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "andino_navigation";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."andino_navigation";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch-ros nav2-bringup navigation2 rviz2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch-ros nav2-bringup navigation2 rviz2 ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "andino_navigation" = substituteSource {
      src = fetchgit {
        name = "andino_navigation-source";
        url = "https://github.com/ros2-gbp/andino-release.git";
        rev = "a01c2d40562736c56160bcfd8ed8e2bae5eba6f7";
        hash = "sha256-hMQiTBtsMybDQ39J05ssJiztgA2UwVLq7HZE3twMM/c=";
      };
    };
  });
  meta = {
    description = "\n    Bring up nav2 package with Andino.\n  ";
  };
})
