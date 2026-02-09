{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pal-gazebo-worlds,
  pal-gripper-controller-configuration,
  pal-gripper-description,
  pal-urdf-utils,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_gripper_simulation";
  version = "3.6.0-1";
  src = finalAttrs.passthru.sources."pal_gripper_simulation";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ pal-gazebo-worlds pal-gripper-controller-configuration pal-gripper-description pal-urdf-utils robot-state-publisher xacro ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ pal-gazebo-worlds pal-gripper-controller-configuration pal-gripper-description pal-urdf-utils robot-state-publisher xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pal_gripper_simulation" = substituteSource {
      src = fetchgit {
        name = "pal_gripper_simulation-source";
        url = "https://github.com/pal-gbp/pal_gripper-release.git";
        rev = "36ffbc176e38d543f658b853c0a134dd99ea0410";
        hash = "sha256-8vceu17qxF97KO7DSyFDWtqmnLpu5CGlndUQvYd1YxY=";
      };
    };
  });
  meta = {
    description = "Pal gripper simulation package";
  };
})
