{
  ament-cmake-catch2,
  ament-cmake-uncrustify,
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nlohmann-json-schema-validator-vendor,
  rmf-api-msgs,
  rmf-task,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "rmf_task_sequence";
  version = "2.1.8-1";
  src = finalAttrs.passthru.sources."rmf_task_sequence";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ nlohmann-json-schema-validator-vendor rmf-api-msgs rmf-task ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "nlohmann-json-dev" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ nlohmann-json-schema-validator-vendor rmf-api-msgs rmf-task ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" ]; };
  checkInputs = [ ament-cmake-catch2 ament-cmake-uncrustify ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_task_sequence" = substituteSource {
      src = fetchgit {
        name = "rmf_task_sequence-source";
        url = "https://github.com/ros2-gbp/rmf_task-release.git";
        rev = "95baffef1b1d8ffc93d4cfdd61c1df177bc4e8f0";
        hash = "sha256-L5/0IECMXRueZ5tciRKxRvN/9sL7+NbIqnxQ6abP6JE=";
      };
    };
  });
  meta = {
    description = "Implementation of phase-sequence tasks for the Robotics Middleware Framework";
  };
})
