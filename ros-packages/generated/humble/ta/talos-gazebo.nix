{
  ament-cmake-auto,
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
  play-motion2-msgs,
  rosSystemPackages,
  substituteSource,
  talos-bringup,
  talos-controller-configuration,
  talos-description,
  talos-moveit-config,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "talos_gazebo";
  version = "2.0.3-1";
  src = finalAttrs.passthru.sources."talos_gazebo";
  nativeBuildInputs = [ ament-cmake-auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gazebo-plugins gazebo-ros gazebo-ros2-control launch launch-pal launch-ros pal-gazebo-plugins pal-gazebo-worlds play-motion2-msgs talos-bringup talos-controller-configuration talos-description talos-moveit-config ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ gazebo-plugins gazebo-ros gazebo-ros2-control launch launch-pal launch-ros pal-gazebo-plugins pal-gazebo-worlds play-motion2-msgs talos-bringup talos-controller-configuration talos-description talos-moveit-config ];
  passthru.sources = mkSourceSet (sources: {
    "talos_gazebo" = substituteSource {
      src = fetchgit {
        name = "talos_gazebo-source";
        url = "https://github.com/pal-gbp/talos_simulation-release.git";
        rev = "b4ffe16b769dc9cfdd264f59d8d4117137a2ab5e";
        hash = "sha256-wGAQAVZdX3FyMrY8VjFTbOVkayUlSVep1daKt3JunjQ=";
      };
    };
  });
  meta = {
    description = "The talos_gazebo package";
  };
})
