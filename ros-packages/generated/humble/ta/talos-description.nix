{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-pal,
  launch-param-builder,
  launch-ros,
  launch-testing-ament-cmake,
  mkSourceSet,
  pal-urdf-utils,
  rosSystemPackages,
  substituteSource,
  talos-controller-configuration,
  talos-description-calibration,
  talos-description-inertial,
  urdf-test,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "talos_description";
  version = "2.9.1-1";
  src = finalAttrs.passthru.sources."talos_description";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ launch launch-pal launch-param-builder launch-ros pal-urdf-utils talos-controller-configuration talos-description-calibration talos-description-inertial xacro ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ launch launch-pal launch-param-builder launch-ros pal-urdf-utils talos-controller-configuration talos-description-calibration talos-description-inertial xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common launch-testing-ament-cmake urdf-test ];
  passthru.sources = mkSourceSet (sources: {
    "talos_description" = substituteSource {
      src = fetchgit {
        name = "talos_description-source";
        url = "https://github.com/pal-gbp/talos_robot-release.git";
        rev = "3f3f5577123be6a2c0c60a8e1ad3dbf7e8d6ecc2";
        hash = "sha256-GjfarH8b8f0adE0O8S4iwgg2STyso3jMML4+uD0D0Rw=";
      };
    };
  });
  meta = {
    description = "The talos_description package";
  };
})
