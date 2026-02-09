{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  forward-command-controller,
  generate-parameter-library,
  kuka-drivers-core,
  mkSourceSet,
  pluginlib,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "joint_group_impedance_controller";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."joint_group_impedance_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ forward-command-controller generate-parameter-library kuka-drivers-core pluginlib ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ forward-command-controller generate-parameter-library kuka-drivers-core pluginlib ];
  passthru.sources = mkSourceSet (sources: {
    "joint_group_impedance_controller" = substituteSource {
      src = fetchgit {
        name = "joint_group_impedance_controller-source";
        url = "https://github.com/ros2-gbp/kuka_drivers-release.git";
        rev = "117b3bf28584f3b2e1a053e7237cfc583de61c95";
        hash = "sha256-AhuafXNvsxKvy5FlTTtJiS0u5P0PhnLz87Pj59FNsTc=";
      };
    };
  });
  meta = {
    description = "Controller for modifying impedance (stiffness and damping) interfaces of a joint group";
  };
})
