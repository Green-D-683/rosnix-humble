{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-plugins,
  gazebo-ros,
  gazebo-ros2-control,
  launch,
  launch-pal,
  launch-ros,
  mkSourceSet,
  pal-gazebo-plugins,
  pal-gazebo-worlds,
  rosSystemPackages,
  substituteSource,
  tiago-pro-head-bringup,
  tiago-pro-head-description,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_pro_head_gazebo";
  version = "1.0.2-1";
  src = finalAttrs.passthru.sources."tiago_pro_head_gazebo";
  nativeBuildInputs = [ ament-cmake-auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gazebo-plugins gazebo-ros gazebo-ros2-control launch launch-pal launch-ros pal-gazebo-plugins pal-gazebo-worlds tiago-pro-head-bringup tiago-pro-head-description ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ gazebo-plugins gazebo-ros gazebo-ros2-control launch launch-pal launch-ros pal-gazebo-plugins pal-gazebo-worlds tiago-pro-head-bringup tiago-pro-head-description ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_pro_head_gazebo" = substituteSource {
      src = fetchgit {
        name = "tiago_pro_head_gazebo-source";
        url = "https://github.com/ros2-gbp/tiago_pro_head_simulation-release.git";
        rev = "29ba02c79ec51190d11eef21939d61d072952edb";
        hash = "sha256-tQuD0pU0CDlMD8wcFx1i+q5BKYOP+s2eMQoMMPiWbGQ=";
      };
    };
  });
  meta = {
    description = "The tiago_pro_head_gazebo package";
  };
})
