{
  ament-cmake,
  buildAmentCmakePackage,
  controller-interface,
  fetchgit,
  fetchurl,
  fetchzip,
  kuka-driver-interfaces,
  kuka-drivers-core,
  mkSourceSet,
  pluginlib,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fri_configuration_controller";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."fri_configuration_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ controller-interface kuka-driver-interfaces kuka-drivers-core pluginlib ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-interface kuka-driver-interfaces kuka-drivers-core pluginlib ];
  passthru.sources = mkSourceSet (sources: {
    "fri_configuration_controller" = substituteSource {
      src = fetchgit {
        name = "fri_configuration_controller-source";
        url = "https://github.com/ros2-gbp/kuka_drivers-release.git";
        rev = "72daaeb81eb653b5f532042d71c5422988fb6950";
        hash = "sha256-9ULqlbnF7yVgTODogZi9NgcgDSjwzO0RccB2yNASWvo=";
      };
    };
  });
  meta = {
    description = "Controller for configuration of FRI";
  };
})
