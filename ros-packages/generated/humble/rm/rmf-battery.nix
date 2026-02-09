{
  ament-cmake-catch2,
  ament-cmake-uncrustify,
  buildCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rmf-traffic,
  rmf-utils,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "rmf_battery";
  version = "0.1.5-1";
  src = finalAttrs.passthru.sources."rmf_battery";
  nativeBuildInputs = [ eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ rmf-traffic rmf-utils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ rmf-traffic rmf-utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-catch2 ament-cmake-uncrustify ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_battery" = substituteSource {
      src = fetchgit {
        name = "rmf_battery-source";
        url = "https://github.com/ros2-gbp/rmf_battery-release.git";
        rev = "dc76e2d05cdf63b395e174b7a54d07b00750b934";
        hash = "sha256-7KUSu6yQUDFeZGyZk56EW0DdiuWcT8cCYloZTsdYG7U=";
      };
    };
  });
  meta = {
    description = "Package for modelling battery life of robots";
  };
})
