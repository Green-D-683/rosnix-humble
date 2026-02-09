{
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing,
  mkSourceSet,
  rcl-logging-interface,
  rcutils,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcl_logging_noop";
  version = "2.3.1-1";
  src = finalAttrs.passthru.sources."rcl_logging_noop";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-empy" ]; };
  propagatedNativeBuildInputs = [ rcl-logging-interface rcutils ];
  buildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-empy" ]; };
  propagatedBuildInputs = [ rcl-logging-interface rcutils ];
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common launch-testing ];
  passthru.sources = mkSourceSet (sources: {
    "rcl_logging_noop" = substituteSource {
      src = fetchgit {
        name = "rcl_logging_noop-source";
        url = "https://github.com/ros2-gbp/rcl_logging-release.git";
        rev = "8fc4653759f7c6c2b5d0cb0e5ab6346ce4bf6a13";
        hash = "sha256-d65yR48B4ECdv2QS+sMPj/PVQoBGdVjVtgGNo54ybuA=";
      };
    };
  });
  meta = {
    description = "An rcl logger implementation that doesn't do anything with log messages.";
  };
})
