{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_resources_prbt_support";
  version = "2.5.9-1";
  src = finalAttrs.passthru.sources."moveit_resources_prbt_support";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ xacro ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_prbt_support" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_support-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "5b15b1b0df9d841d0b09466bb3428ba4a22a0a3e";
        hash = "sha256-A+v7QsgnLWdYPlHvv81mlCG0ju0zpPtvQI1PXY1P6AU=";
      };
    };
  });
  meta = {
    description = " Mechanical, kinematic and visual description\n  of the Pilz light weight arm PRBT. ";
  };
})
