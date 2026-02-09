{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "irobot_create_ignition_plugins";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."irobot_create_ignition_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "ignition-common4" "ignition-gazebo6" "ignition-plugin" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "ignition-common4" "ignition-gazebo6" "ignition-plugin" ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "irobot_create_ignition_plugins" = substituteSource {
      src = fetchgit {
        name = "irobot_create_ignition_plugins-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "e77a9379a76de9d670509144c93b97c34047628d";
        hash = "sha256-SYK7D5LV02eVcDUL+2zNsdFMEnO6LsrR8RE+1Nb7Z7U=";
      };
    };
  });
  meta = {
    description = "Ignition plugins for simulated iRobot(R) Create(R) 3 Educational Robot.";
  };
})
