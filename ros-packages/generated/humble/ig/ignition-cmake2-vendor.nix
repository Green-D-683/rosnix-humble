{
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-cmake-xmllint,
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "ignition_cmake2_vendor";
  version = "0.0.2-2";
  src = finalAttrs.passthru.sources."ignition_cmake2_vendor";
  nativeBuildInputs = [ ament-cmake-test ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "doxygen" "git" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "ignition-cmake2" ]; };
  buildInputs = [ ament-cmake-test ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" "doxygen" "git" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "ignition-cmake2" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "ignition_cmake2_vendor" = substituteSource {
      src = fetchgit {
        name = "ignition_cmake2_vendor-source";
        url = "https://github.com/ros2-gbp/ignition_cmake2_vendor-release.git";
        rev = "18bf27798d4be2ba4a85e9e9fb129681e4e7af2b";
        hash = "sha256-bZxidfrsqkCbbKbqdgbiC7SuwHBPMfR+/87ZeJpKzZY=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/ignitionrobotics/ign-cmake.git";
          to = "URL ${sources."ignition_cmake2_vendor/ign-cmake"}";
        }
      ];
    };
    "ignition_cmake2_vendor/ign-cmake" = substituteSource {
      src = fetchgit {
        name = "ign-cmake-source";
        url = "https://github.com/ignitionrobotics/ign-cmake.git";
        rev = "44a699cf4be75254ca9bf2a0a5cfa25369e0ccb4";
        hash = "sha256-oCnSYhbGES09TZ9lpGp5jHib0IvNQ8dNti+m2YcQH30=";
      };
    };
  });
  meta = {
    description = "This package provides the Ignition CMake 2.x library.";
  };
})
