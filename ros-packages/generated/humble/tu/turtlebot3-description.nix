{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  urdf,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_description";
  version = "2.3.6-1";
  src = finalAttrs.passthru.sources."turtlebot3_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ urdf xacro ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_description" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_description-source";
        url = "https://github.com/ros2-gbp/turtlebot3-release.git";
        rev = "6baf22d6c41a72e60c7b65c136cbd860797bc0de";
        hash = "sha256-fD1WISmVXD/tGSUyvXtT7h4WLMLbOqh7vrC7/WzTFj8=";
      };
    };
  });
  meta = {
    description = "\n    3D models of the TurtleBot3 for simulation and visualization\n  ";
  };
})
