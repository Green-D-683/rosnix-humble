{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  mkSourceSet,
  moveit-resources-fanuc-description,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_resources_fanuc_moveit_config";
  version = "2.0.7-1";
  src = finalAttrs.passthru.sources."moveit_resources_fanuc_moveit_config";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ joint-state-publisher moveit-resources-fanuc-description robot-state-publisher tf2-ros xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher moveit-resources-fanuc-description robot-state-publisher tf2-ros xacro ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_fanuc_moveit_config" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_fanuc_moveit_config-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "edf77cd9002406349d8846c7fa5f4147c6e2a190";
        hash = "sha256-+PG1w20lR8UBbDk6I7oZisHaDj35FiW/5sIftyu+h+U=";
      };
    };
  });
  meta = {
    description = "\n    ";
  };
})
