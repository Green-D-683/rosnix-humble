{
  ament-cmake,
  ament-cmake-gen-version-h,
  ament-cmake-gtest,
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
  pname = "ament_index_cpp";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."ament_index_cpp";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  buildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ament_index_cpp" = substituteSource {
      src = fetchgit {
        name = "ament_index_cpp-source";
        url = "https://github.com/ros2-gbp/ament_index-release.git";
        rev = "e1fa6b8bfc6dd3c85cb0482bb7c4d042ad958e05";
        hash = "sha256-5VlZ0gHb6uLzlNLsnIL8IocsaJlazzdTWe/JLEHR0kc=";
      };
    };
  });
  meta = {
    description = "\n    C++ API to access the ament resource index.\n  ";
  };
})
