{
  ament-cmake-catch2,
  ament-cmake-uncrustify,
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rmf-battery,
  rmf-utils,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "rmf_task";
  version = "2.1.8-1";
  src = finalAttrs.passthru.sources."rmf_task";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ rmf-battery rmf-utils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ rmf-battery rmf-utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-catch2 ament-cmake-uncrustify ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_task" = substituteSource {
      src = fetchgit {
        name = "rmf_task-source";
        url = "https://github.com/ros2-gbp/rmf_task-release.git";
        rev = "b49b42823cbec02b769776ac817254f5fb1e672a";
        hash = "sha256-Rc2yKMEdJqy1SiPfAOPUs4YCDVvsvYAY3M8Ggn5/WoE=";
      };
    };
  });
  meta = {
    description = "Package for managing tasks in the Robotics Middleware Framework";
  };
})
