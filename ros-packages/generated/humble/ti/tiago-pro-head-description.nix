{
  ament-cmake-auto,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-param-builder,
  launch-testing-ament-cmake,
  mkSourceSet,
  pal-urdf-utils,
  realsense2-description,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  tiago-pro-head-controller-configuration,
  urdf-test,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_pro_head_description";
  version = "1.7.0-1";
  src = finalAttrs.passthru.sources."tiago_pro_head_description";
  nativeBuildInputs = [ ament-cmake-auto ament-cmake-python ];
  propagatedNativeBuildInputs = [ launch-param-builder pal-urdf-utils realsense2-description robot-state-publisher tiago-pro-head-controller-configuration xacro ];
  buildInputs = [ ament-cmake-auto ament-cmake-python ];
  propagatedBuildInputs = [ launch-param-builder pal-urdf-utils realsense2-description robot-state-publisher tiago-pro-head-controller-configuration xacro ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch-testing-ament-cmake urdf-test ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_pro_head_description" = substituteSource {
      src = fetchgit {
        name = "tiago_pro_head_description-source";
        url = "https://github.com/ros2-gbp/tiago_pro_head_robot-release.git";
        rev = "7e0979e27819b7b03f589487e0fe94cb6b8eba72";
        hash = "sha256-JlJUkFVrPzWOV/WfiyoknBPuz1TGsc3/mnXWcnYO1YI=";
      };
    };
  });
  meta = {
    description = "The tiago_pro_head_description package";
  };
})
