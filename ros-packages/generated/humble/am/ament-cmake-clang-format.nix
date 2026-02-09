{
  ament-clang-format,
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_clang_format";
  version = "0.12.14-1";
  src = finalAttrs.passthru.sources."ament_cmake_clang_format";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-clang-format ament-cmake-test ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-clang-format ament-cmake-test ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_clang_format" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_clang_format-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "bab2dae368789417aafc721c1567d790b1cebac1";
        hash = "sha256-XMGk5IMC8hYMeXhBobG98fh2HU/g1LTwXJYvxXRLnOI=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_clang_format to lint C / C++ code using clang format.\n  ";
  };
})
