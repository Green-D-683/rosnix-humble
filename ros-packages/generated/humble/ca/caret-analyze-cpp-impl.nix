{
  ament-cmake,
  ament-cmake-gmock,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pybind11-vendor,
  python-cmake-module,
  rosSystemPackages,
  substituteSource,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "caret_analyze_cpp_impl";
  version = "0.5.0-5";
  src = finalAttrs.passthru.sources."caret_analyze_cpp_impl";
  nativeBuildInputs = [ ament-cmake python-cmake-module ];
  propagatedNativeBuildInputs = [ pybind11-vendor yaml-cpp-vendor ];
  buildInputs = [ ament-cmake python-cmake-module ];
  propagatedBuildInputs = [ pybind11-vendor yaml-cpp-vendor ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "caret_analyze_cpp_impl" = substituteSource {
      src = fetchgit {
        name = "caret_analyze_cpp_impl-source";
        url = "https://github.com/ros2-gbp/caret_analyze_cpp_impl-release.git";
        rev = "ac598f3f19bf8b93fd132ce73ccea4462639cb76";
        hash = "sha256-Cl4nLemRGQwl+ggu2uetpTD3n8t1r8v/NTDjdTGYwdo=";
      };
    };
  });
  meta = {
    description = "c++ implementation of caret_analyze";
  };
})
