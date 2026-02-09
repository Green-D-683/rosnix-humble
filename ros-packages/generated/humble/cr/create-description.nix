{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-xml,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  urdf,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "create_description";
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."create_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ launch-xml robot-state-publisher urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch-xml robot-state-publisher urdf xacro ];
  passthru.sources = mkSourceSet (sources: {
    "create_description" = substituteSource {
      src = fetchgit {
        name = "create_description-source";
        url = "https://github.com/AutonomyLab/create_autonomy-release.git";
        rev = "c374c4ab4eaa51a327a206c8022572eb80afe77b";
        hash = "sha256-G8MqHWNRsOxe5Owcp+iehoSW/IVZU1RDYojjaoDm0ZU=";
      };
    };
  });
  meta = {
    description = "Robot URDF descriptions for create_robot";
  };
})
