{
  ament-clang-tidy,
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
  pname = "ament_cmake_clang_tidy";
  version = "0.12.14-1";
  src = finalAttrs.passthru.sources."ament_cmake_clang_tidy";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-clang-tidy ament-cmake-test ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-clang-tidy ament-cmake-test ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_clang_tidy" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_clang_tidy-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "1f6aac4872a96277c5396ca69993fa8cb358d9ec";
        hash = "sha256-PZLwqud2Y/J5oJrCNLBgzttbdLWSM+BSRW9/p+icsZ4=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_clang_tidy to lint C / C++ code using clang tidy.\n  ";
  };
})
