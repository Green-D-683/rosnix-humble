{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-google-benchmark,
  ament-cmake-gtest,
  ament-cmake-lint-cmake,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  buildAmentCmakePackage,
  builtin-interfaces,
  console-bridge-vendor,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rcutils,
  rosSystemPackages,
  rosidl-runtime-cpp,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2";
  version = "0.25.18-1";
  src = finalAttrs.passthru.sources."tf2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces console-bridge-vendor geometry-msgs rcutils rosidl-runtime-cpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libconsole-bridge-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces console-bridge-vendor geometry-msgs rcutils rosidl-runtime-cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libconsole-bridge-dev" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-google-benchmark ament-cmake-gtest ament-cmake-lint-cmake ament-cmake-uncrustify ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "tf2" = substituteSource {
      src = fetchgit {
        name = "tf2-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "bc7c25495c0fee9b741d75140ee03f257162c09e";
        hash = "sha256-UmiLHNqHVxZFr43TNooi3XTkFumLFtgV8/j7tRckDZs=";
      };
    };
  });
  meta = {
    description = "\n    tf2 is the second generation of the transform library, which lets\n    the user keep track of multiple coordinate frames over time. tf2\n    maintains the relationship between coordinate frames in a tree\n    structure buffered in time, and lets the user transform points,\n    vectors, etc between any two coordinate frames at any desired\n    point in time.\n  ";
  };
})
