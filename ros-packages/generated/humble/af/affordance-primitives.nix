{
  ament-clang-format,
  ament-clang-tidy,
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-gtest,
  ament-cmake-lint-cmake,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tf2-eigen,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "affordance_primitives";
  version = "0.1.0-3";
  src = finalAttrs.passthru.sources."affordance_primitives";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs tf2-eigen ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs tf2-eigen ];
  checkInputs = [ ament-clang-format ament-clang-tidy ament-cmake-copyright ament-cmake-gtest ament-cmake-lint-cmake ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "affordance_primitives" = substituteSource {
      src = fetchgit {
        name = "affordance_primitives-source";
        url = "https://github.com/PickNikRobotics/affordance_primitives-release.git";
        rev = "4314af7d9f5595083ea8dc9b1ad7e597d034c67b";
        hash = "sha256-GqEFF/3Ttnk78/fLYfjHlvn3mctvgNnkhS/qTJK/KTM=";
      };
    };
  });
  meta = {
    description = "Library for affordance motion primitives.";
  };
})
