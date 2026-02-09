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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "python_cmake_module";
  version = "0.10.0-2";
  src = finalAttrs.passthru.sources."python_cmake_module";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "python_cmake_module" = substituteSource {
      src = fetchgit {
        name = "python_cmake_module-source";
        url = "https://github.com/ros2-gbp/python_cmake_module-release.git";
        rev = "afb4c5c6c5f78ced88a5f5802caf5707025b6b33";
        hash = "sha256-q4W1DWKOd7QWWbr0OQrkiC+TBZptN74ufvEGNY/qtN8=";
      };
    };
  });
  meta = {
    description = "Provide CMake module with extra functionality for Python.";
  };
})
