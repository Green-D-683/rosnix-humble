{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "scenario_execution_interfaces";
  version = "1.2.0-2";
  src = finalAttrs.passthru.sources."scenario_execution_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_interfaces" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_interfaces-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "f563bfc45906453ee62c482fd786cd6fc46529c2";
        hash = "sha256-nKQT3rPBMOSVVolAZEBNP1ZPUFSkckOXIvxMb9Ak74I=";
      };
    };
  });
  meta = {
    description = "ROS2 Interfaces for Scenario Execution";
  };
})
