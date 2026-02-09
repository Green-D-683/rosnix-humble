{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  inverse-dynamics-solver,
  mkSourceSet,
  pluginlib,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "franka_inria_inverse_dynamics_solver";
  version = "1.0.3-1";
  src = finalAttrs.passthru.sources."franka_inria_inverse_dynamics_solver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ inverse-dynamics-solver pluginlib ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ inverse-dynamics-solver pluginlib ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "franka_inria_inverse_dynamics_solver" = substituteSource {
      src = fetchgit {
        name = "franka_inria_inverse_dynamics_solver-source";
        url = "https://github.com/ros2-gbp/inverse_dynamics_solver-release.git";
        rev = "1d8d7261c7f4416892144d7abf64a14a3b8ef3db";
        hash = "sha256-ZzVB6b1/wQA46u+qzeLjrkoR6nm8CJAZ5IU56OBRy0I=";
      };
    };
  });
  meta = {
    description = "A C++ library implementing the inverse dynamics solver for the Franka Emika Panda (FER) real robot.";
  };
})
