{
  ament-cmake,
  buildAmentCmakePackage,
  desktop,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  perception,
  ros-ign-gazebo-demos,
  rosSystemPackages,
  simulation,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "desktop_full";
  version = "0.10.0-1";
  src = finalAttrs.passthru.sources."desktop_full";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ desktop perception ros-ign-gazebo-demos simulation ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ desktop perception ros-ign-gazebo-demos simulation ];
  passthru.sources = mkSourceSet (sources: {
    "desktop_full" = substituteSource {
      src = fetchgit {
        name = "desktop_full-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "a47f052fb2393dcc217944068975064b2ab3020c";
        hash = "sha256-Fpf8KQVw8ZcNqmf/8VyrlxunQpvxC9fZZHZVUBkM4IU=";
      };
    };
  });
  meta = {
    description = "Provides a \"batteries included\" experience to novice users.";
  };
})
