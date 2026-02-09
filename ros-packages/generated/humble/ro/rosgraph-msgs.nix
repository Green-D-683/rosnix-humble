{
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
  pname = "rosgraph_msgs";
  version = "1.2.2-1";
  src = finalAttrs.passthru.sources."rosgraph_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosgraph_msgs" = substituteSource {
      src = fetchgit {
        name = "rosgraph_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "5d92fef788ba4913b8f99fab7425a4ae76735442";
        hash = "sha256-QGFitpVt/JzNgNnJkjOf4kuuAEZFiS4GhwhcwD7mybE=";
      };
    };
  });
  meta = {
    description = "\n    Messages relating to the ROS Computation Graph.\n    These are generally considered to be low-level messages that end users do not interact with.\n  ";
  };
})
