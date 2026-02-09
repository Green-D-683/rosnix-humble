{
  ament-cmake,
  buildAmentCmakePackage,
  clearpath-platform-description,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher-gui,
  mkSourceSet,
  rosSystemPackages,
  rqt-robot-monitor,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_viz";
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."clearpath_viz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ clearpath-platform-description joint-state-publisher-gui rqt-robot-monitor rviz2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-platform-description joint-state-publisher-gui rqt-robot-monitor rviz2 ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_viz" = substituteSource {
      src = fetchgit {
        name = "clearpath_viz-source";
        url = "https://github.com/clearpath-gbp/clearpath_desktop-release.git";
        rev = "693eb94ef83719c846a0d88ce6324699dda24fa2";
        hash = "sha256-COdwmfb7TmWdfvHPi0XkwzLvhFD+OvMND6NcMviLbjo=";
      };
    };
  });
  meta = {
    description = "Visualization launchers for Clearpath Platforms.";
  };
})
