{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nao_command_msgs";
  version = "0.0.5-1";
  src = finalAttrs.passthru.sources."nao_command_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nao_command_msgs" = substituteSource {
      src = fetchgit {
        name = "nao_command_msgs-source";
        url = "https://github.com/ros2-gbp/nao_interfaces-release.git";
        rev = "7790e581f49c7c8f45c73a46c7df8e2ea7c03e1e";
        hash = "sha256-QdbcY85fChTitWJIYAuyieZ4hY+hXZWJP6w/k8+BOWw=";
      };
    };
  });
  meta = {
    description = "Package defining command msgs to be sent to NAO robot.";
  };
})
