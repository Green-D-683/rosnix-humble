{
  ament-cmake-auto,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-copyright,
  ament-flake8,
  ament-pep257,
  autoware-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-testing,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_testing";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_testing";
  nativeBuildInputs = [ ament-cmake-auto ament-cmake-lint-cmake autoware-cmake ];
  propagatedNativeBuildInputs = [ ros-testing ];
  buildInputs = [ ament-cmake-auto ament-cmake-lint-cmake autoware-cmake ];
  propagatedBuildInputs = [ ros-testing ];
  checkInputs = [ ament-cmake-core ament-copyright ament-flake8 ament-pep257 ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_testing" = substituteSource {
      src = fetchgit {
        name = "autoware_testing-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "ea1623faa8167ad4a796fbb922d59952477ca5cf";
        hash = "sha256-XYw6Fh+ABXgfZ9Aq8dzS93SWQSFl4iV5YFKXAqGlrRQ=";
      };
    };
  });
  meta = {
    description = "Tools for handling standard tests based on ros_testing";
  };
})
