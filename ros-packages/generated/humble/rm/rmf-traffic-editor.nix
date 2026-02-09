{
  ament-cmake,
  ament-cmake-uncrustify,
  ament-index-cpp,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rmf-utils,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_traffic_editor";
  version = "1.6.3-1";
  src = finalAttrs.passthru.sources."rmf_traffic_editor";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-cmake ament-index-cpp rmf-utils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libceres-dev" "libgoogle-glog-dev" "libqt5-concurrent" "libqt5-widgets" "proj" "qtbase5-dev" "yaml-cpp" ]; };
  propagatedBuildInputs = [ ament-cmake ament-index-cpp rmf-utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libceres-dev" "libgoogle-glog-dev" "libqt5-concurrent" "libqt5-widgets" "proj" "qtbase5-dev" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-uncrustify ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_traffic_editor" = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_editor-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "1683d5e30b0eaed50bd8ed442db3eb45c126e6f3";
        hash = "sha256-FAOluWUuHsofKvH3PhgVScDoJvE8yHvZ4NKBZZINM5w=";
      };
    };
  });
  meta = {
    description = "traffic editor";
  };
})
