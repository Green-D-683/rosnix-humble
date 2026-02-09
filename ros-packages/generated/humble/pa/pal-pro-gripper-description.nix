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
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_pro_gripper_description";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."pal_pro_gripper_description";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ pal-urdf-utils xacro ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ pal-urdf-utils xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pal_pro_gripper_description" = substituteSource {
      src = fetchgit {
        name = "pal_pro_gripper_description-source";
        url = "https://github.com/ros2-gbp/pal_pro_gripper-release.git";
        rev = "5b2cbf8ad3c9a805f9ac994d2cc5e368a4791f10";
        hash = "sha256-ARUE7JIKEm6I286eHWnsnire0uzHa26uWVRjvdbpfY4=";
      };
    };
  });
  meta = {
    description = "The pal_pro_gripper_description package";
  };
})
