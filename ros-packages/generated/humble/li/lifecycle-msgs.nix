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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lifecycle_msgs";
  version = "1.2.2-1";
  src = finalAttrs.passthru.sources."lifecycle_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "lifecycle_msgs" = substituteSource {
      src = fetchgit {
        name = "lifecycle_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "47361f30e84a4e0d5efc53123077c9676b29034b";
        hash = "sha256-kPxz/bWHK7jt01ku0J3kuLsXKKbFs0BswCFJ4kUy4og=";
      };
    };
  });
  meta = {
    description = "A package containing some lifecycle related message and service definitions.";
  };
})
