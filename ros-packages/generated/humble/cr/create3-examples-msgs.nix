{
  action-msgs,
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "create3_examples_msgs";
  version = "0.0.5-1";
  src = finalAttrs.passthru.sources."create3_examples_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "create3_examples_msgs" = substituteSource {
      src = fetchgit {
        name = "create3_examples_msgs-source";
        url = "https://github.com/ros2-gbp/create3_examples-release.git";
        rev = "847ce51c87eb07d2bc1bcf42960fc7bee0e3ab3d";
        hash = "sha256-MJC3V5OWF5Q3pmhmy7oTutCNNEG/1JDyK2Ri96jEJ50=";
      };
    };
  });
  meta = {
    description = "Package containing action, message and service definitions used by the iRobot(R) Create(R) 3 examples";
  };
})
