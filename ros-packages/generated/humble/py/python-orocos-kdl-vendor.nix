{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  orocos-kdl-vendor,
  pybind11-vendor,
  python-cmake-module,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "python_orocos_kdl_vendor";
  version = "0.2.5-1";
  src = finalAttrs.passthru.sources."python_orocos_kdl_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-python python-cmake-module ];
  propagatedNativeBuildInputs = [ orocos-kdl-vendor pybind11-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pykdl" ]; };
  buildInputs = [ ament-cmake ament-cmake-python python-cmake-module ];
  propagatedBuildInputs = [ orocos-kdl-vendor pybind11-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pykdl" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "python_orocos_kdl_vendor" = substituteSource {
      src = fetchgit {
        name = "python_orocos_kdl_vendor-source";
        url = "https://github.com/ros2-gbp/orocos_kdl_vendor-release.git";
        rev = "8cd99798448ebd98447a35af86b1626abe7813d8";
        hash = "sha256-PYtcHErPdFtIDbcz/XX1DVOn5Yj/mMaj0D4vmUFqkKA=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/orocos/orocos_kinematics_dynamics/archive/507de66205e14b12c8c65f25eafc05c4dc66e21e.zip";
          to = "URL ${sources."python_orocos_kdl_vendor/507de66205e14b12c8c65f25eafc05c4dc66e21e"}";
        }
      ];
    };
    "python_orocos_kdl_vendor/507de66205e14b12c8c65f25eafc05c4dc66e21e" = substituteSource {
      src = fetchzip {
        name = "507de66205e14b12c8c65f25eafc05c4dc66e21e-source";
        url = "https://github.com/orocos/orocos_kinematics_dynamics/archive/507de66205e14b12c8c65f25eafc05c4dc66e21e.zip";
        hash = "sha256-4x7nZw04MWFJkvPnnH+w/E6ystOdi8QjSMm+omQ0Z8Y=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around PyKDL, providing nothing but a dependency on PyKDL on some systems.\n    On others, it fetches and builds python_orocos_kdl locally.\n  ";
  };
})
