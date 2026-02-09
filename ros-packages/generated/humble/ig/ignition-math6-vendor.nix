{
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-cmake-xmllint,
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ignition-cmake2-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "ignition_math6_vendor";
  version = "0.0.2-2";
  src = finalAttrs.passthru.sources."ignition_math6_vendor";
  nativeBuildInputs = [ ament-cmake-test ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "git" ]; };
  propagatedNativeBuildInputs = [ ignition-cmake2-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "ignition-math6" ]; };
  buildInputs = [ ament-cmake-test ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" "git" ]; };
  propagatedBuildInputs = [ ignition-cmake2-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "ignition-math6" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "ignition_math6_vendor" = substituteSource {
      src = fetchgit {
        name = "ignition_math6_vendor-source";
        url = "https://github.com/ros2-gbp/ignition_math6_vendor-release.git";
        rev = "b5212d1728b71644c7c817796bb37ec7fa33b46b";
        hash = "sha256-HR32tjvnD5KaVPw4YWj43yrNsA3PGhuwcALJlBciHYQ=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/ignitionrobotics/ign-math.git";
          to = "URL ${sources."ignition_math6_vendor/ign-math"}";
        }
      ];
    };
    "ignition_math6_vendor/ign-math" = substituteSource {
      src = fetchgit {
        name = "ign-math-source";
        url = "https://github.com/ignitionrobotics/ign-math.git";
        rev = "23bf73a3f88fc8fe6d86c00cc8d304f52be1f264";
        hash = "sha256-yR9QjREmIdXaCxwjNBhFJZpw8x5V0FfdmcD0eB0cAhI=";
      };
    };
  });
  meta = {
    description = "This package provides the Ignition Math 6.x library.";
  };
})
