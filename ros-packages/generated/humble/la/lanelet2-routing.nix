{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lanelet2-core,
  lanelet2-traffic-rules,
  mkSourceSet,
  mrt-cmake-modules,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lanelet2_routing";
  version = "1.2.2-1";
  src = finalAttrs.passthru.sources."lanelet2_routing";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ lanelet2-core lanelet2-traffic-rules mrt-cmake-modules ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ lanelet2-core lanelet2-traffic-rules mrt-cmake-modules ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "lanelet2_routing" = substituteSource {
      src = fetchgit {
        name = "lanelet2_routing-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "e0b01db44511ccaaee694d3d1d28239ebdbe218c";
        hash = "sha256-fhj3GQXg1faZrOE8j88PvepCcRbGKJL65MwZwxhDkK0=";
      };
    };
  });
  meta = {
    description = "Routing module for lanelet2";
  };
})
