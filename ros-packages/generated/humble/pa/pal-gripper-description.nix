{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pal-urdf-utils,
  rosSystemPackages,
  substituteSource,
  urdf-test,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_gripper_description";
  version = "3.6.0-1";
  src = finalAttrs.passthru.sources."pal_gripper_description";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ pal-urdf-utils xacro ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ pal-urdf-utils xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common urdf-test ];
  passthru.sources = mkSourceSet (sources: {
    "pal_gripper_description" = substituteSource {
      src = fetchgit {
        name = "pal_gripper_description-source";
        url = "https://github.com/pal-gbp/pal_gripper-release.git";
        rev = "a3f91169320c2ed621a91c263b4b9f4f1b10f5a1";
        hash = "sha256-6wHzWLyu84oQBY2iUPndbbsI+OPET3r3AfJ4swJwUK4=";
      };
    };
  });
  meta = {
    description = "The pal_gripper_description package";
  };
})
