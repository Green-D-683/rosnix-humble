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
  launch-pal,
  mkSourceSet,
  nav2-bringup,
  omni-base-2dnav,
  omni-base-bringup,
  omni-base-description,
  omni-base-laser-sensors,
  pal-gazebo-plugins,
  pal-gazebo-worlds,
  pal-maps,
  pal-urdf-utils,
  ros2launch,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "omni_base_gazebo";
  version = "2.10.1-1";
  src = finalAttrs.passthru.sources."omni_base_gazebo";
  nativeBuildInputs = [ ament-cmake-auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gazebo-plugins gazebo-ros gazebo-ros2-control launch-pal nav2-bringup omni-base-2dnav omni-base-bringup omni-base-description omni-base-laser-sensors pal-gazebo-plugins pal-gazebo-worlds pal-maps pal-urdf-utils ros2launch ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ gazebo-plugins gazebo-ros gazebo-ros2-control launch-pal nav2-bringup omni-base-2dnav omni-base-bringup omni-base-description omni-base-laser-sensors pal-gazebo-plugins pal-gazebo-worlds pal-maps pal-urdf-utils ros2launch ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "omni_base_gazebo" = substituteSource {
      src = fetchgit {
        name = "omni_base_gazebo-source";
        url = "https://github.com/pal-gbp/omni_base_simulation-release.git";
        rev = "295cdedca7795e58a3bf87a4609d81ff446109f9";
        hash = "sha256-qYOTuUGkqWfqL4L8RBCZmrcjvcTjOQ+sxNUD6QcKl4M=";
      };
    };
  });
  meta = {
    description = "The omni_base_gazebo package";
  };
})
