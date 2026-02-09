{
  action-msgs,
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "psdk_interfaces";
  version = "1.3.2-1";
  src = finalAttrs.passthru.sources."psdk_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs geometry-msgs std-msgs std-srvs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs geometry-msgs std-msgs std-srvs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "psdk_interfaces" = substituteSource {
      src = fetchgit {
        name = "psdk_interfaces-source";
        url = "https://github.com/ros2-gbp/psdk_ros2-release.git";
        rev = "0f375e65abc9e2c11605df73af0ebebbe982ecc6";
        hash = "sha256-UA4sBA4YVyjvVlr7rHj2i0jRihYn6aFN6kR3NPJN+So=";
      };
    };
  });
  meta = {
    description = "Provides custom message, srv and action types for psdk ros2 wrapper";
  };
})
