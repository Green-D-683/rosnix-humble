{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcl-interfaces,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "composition_interfaces";
  version = "1.2.2-1";
  src = finalAttrs.passthru.sources."composition_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rcl-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rcl-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "composition_interfaces" = substituteSource {
      src = fetchgit {
        name = "composition_interfaces-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "43b99c5eea80b5c2fa7bf1e144492cecaca9f70f";
        hash = "sha256-kt9EWeAWCAfXHW9a0LK7AMdK6DdoTd5b1Z79mI6JuPg=";
      };
    };
  });
  meta = {
    description = "A package containing message and service definitions for managing composable nodes in a container process.";
  };
})
