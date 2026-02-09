{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "situational_graphs_msgs";
  version = "0.0.1-2";
  src = finalAttrs.passthru.sources."situational_graphs_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs visualization-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "situational_graphs_msgs" = substituteSource {
      src = fetchgit {
        name = "situational_graphs_msgs-source";
        url = "https://github.com/ros2-gbp/situational_graphs_msgs-release.git";
        rev = "d429f63e2cb5374218f7b7082cd74a671e7418c0";
        hash = "sha256-Mhc2Zl/ZUVUM/Ot6wPmukpeW8PZeldbasBwSMe5eqws=";
      };
    };
  });
  meta = {
    description = "Custom messages for s_graphs";
  };
})
