{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pybind11_vendor";
  version = "2.4.2-1";
  src = finalAttrs.passthru.sources."pybind11_vendor";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "pybind11-dev" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "pybind11-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "pybind11_vendor" = substituteSource {
      src = fetchgit {
        name = "pybind11_vendor-source";
        url = "https://github.com/ros2-gbp/pybind11_vendor-release.git";
        rev = "dc70c591e023aaf6e9da9f193dce726004555fa4";
        hash = "sha256-cT3uRbcmI/lPhd01+fp3uBdAtMhNu4rZB9UMmr+g5z4=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/pybind/pybind11.git";
          to = "URL ${sources."pybind11_vendor/pybind11"}";
        }
      ];
    };
    "pybind11_vendor/pybind11" = substituteSource {
      src = fetchgit {
        name = "pybind11-source";
        url = "https://github.com/pybind/pybind11.git";
        rev = "ffa346860b306c9bbfb341aed9c14c067751feb8";
        hash = "sha256-wBvEWQlZhHoSCMbGgYtB3alWBLA8mA8Mz6JPLhXa3Pc=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around pybind11.\n  ";
  };
})
