{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "orocos_kdl_vendor";
  version = "0.2.5-1";
  src = finalAttrs.passthru.sources."orocos_kdl_vendor";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [ eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "liborocos-kdl-dev" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  propagatedBuildInputs = [ eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "liborocos-kdl-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "orocos_kdl_vendor" = substituteSource {
      src = fetchgit {
        name = "orocos_kdl_vendor-source";
        url = "https://github.com/ros2-gbp/orocos_kdl_vendor-release.git";
        rev = "16e565aaeb8d569bbd798590cac69376a0378100";
        hash = "sha256-vEX/5/Q4uhjraExgZ6Rn5FVy5clSoLJ7GlirhXzeAr4=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/orocos/orocos_kinematics_dynamics.git";
          to = "URL ${sources."orocos_kdl_vendor/orocos_kinematics_dynamics"}";
        }
      ];
    };
    "orocos_kdl_vendor/orocos_kinematics_dynamics" = substituteSource {
      src = fetchgit {
        name = "orocos_kinematics_dynamics-source";
        url = "https://github.com/orocos/orocos_kinematics_dynamics.git";
        rev = "507de66205e14b12c8c65f25eafc05c4dc66e21e";
        hash = "sha256-noKuZn6aXbM5Q1jSaIj21BjOnZCzcSLVDaUp0iz1X60=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around orocos_kdl, providing nothing but a dependency on orocos_kdl on some systems.\n    On others, it fetches and builds orocos_kdl locally.\n  ";
  };
})
