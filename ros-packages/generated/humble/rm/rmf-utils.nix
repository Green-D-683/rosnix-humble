{
  ament-cmake-catch2,
  ament-cmake-uncrustify,
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "rmf_utils";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."rmf_utils";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  checkInputs = [ ament-cmake-catch2 ament-cmake-uncrustify ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_utils" = substituteSource {
      src = fetchgit {
        name = "rmf_utils-source";
        url = "https://github.com/ros2-gbp/rmf_utils-release.git";
        rev = "14873c4b5c2f4a3c2f93e47c04e9f12bc1392a8f";
        hash = "sha256-NEaeaBHvPcbXVB9tpwPVV0cnXWnKwDN8RTa2Z6gWNZE=";
      };
    };
  });
  meta = {
    description = "Simple C++ programming utilities used by Robotics Middleware Framework packages";
  };
})
