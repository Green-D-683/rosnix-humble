{
  ament-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher-gui,
  mkSourceSet,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "franka_description";
  version = "1.0.1-3";
  src = finalAttrs.passthru.sources."franka_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ joint-state-publisher-gui rviz2 xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher-gui rviz2 xacro ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "franka_description" = substituteSource {
      src = fetchgit {
        name = "franka_description-source";
        url = "https://github.com/ros2-gbp/franka_description-release.git";
        rev = "9e678d92d9d776cca21f435df90aa67703d418e5";
        hash = "sha256-L8EDWrGh4O9ZpN+XndOJ3Dakjzi3LN6ioi0RXEx2g+o=";
      };
    };
  });
  meta = {
    description = "franka_description contains URDF files and meshes of Franka robots";
  };
})
