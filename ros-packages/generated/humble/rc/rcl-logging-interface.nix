{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcpputils,
  rcutils,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcl_logging_interface";
  version = "2.3.1-1";
  src = finalAttrs.passthru.sources."rcl_logging_interface";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rcutils ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rcutils ];
  checkInputs = [ ament-lint-auto ament-lint-common rcpputils ];
  passthru.sources = mkSourceSet (sources: {
    "rcl_logging_interface" = substituteSource {
      src = fetchgit {
        name = "rcl_logging_interface-source";
        url = "https://github.com/ros2-gbp/rcl_logging-release.git";
        rev = "0a993aadebdf589566ddac5e146b8270d7383e39";
        hash = "sha256-/HoV3O8tuCcWjhpSADIOGW3zKPajWVYtqZ7F2Pq3E9U=";
      };
    };
  });
  meta = {
    description = "Interface that rcl_logging backends needs to implement.";
  };
})
