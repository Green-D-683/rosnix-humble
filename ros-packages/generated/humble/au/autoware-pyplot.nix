{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pybind11-vendor,
  python-cmake-module,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_pyplot";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_pyplot";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake python-cmake-module ];
  propagatedNativeBuildInputs = [ pybind11-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" "python3-matplotlib" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake python-cmake-module ];
  propagatedBuildInputs = [ pybind11-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-dev" "python3-matplotlib" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_pyplot" = substituteSource {
      src = fetchgit {
        name = "autoware_pyplot-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "e0f27ec34de7ac4b9fda23d26a4f04d1904c7a4f";
        hash = "sha256-4cA1TkE67uxAb5+HpT80PvmU/mZqYFJXBhK+EVDHEC0=";
      };
    };
  });
  meta = {
    description = "C++ interface for matplotlib based on pybind11";
  };
})
