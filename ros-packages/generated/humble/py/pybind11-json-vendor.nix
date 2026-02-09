{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pybind11-vendor,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pybind11_json_vendor";
  version = "0.2.3-1";
  src = finalAttrs.passthru.sources."pybind11_json_vendor";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [ pybind11-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  propagatedBuildInputs = [ pybind11-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "pybind11_json_vendor" = substituteSource {
      src = fetchgit {
        name = "pybind11_json_vendor-source";
        url = "https://github.com/ros2-gbp/pybind11_json_vendor-release.git";
        rev = "032e07918c37f0cc17b612754aae2df8a8319ec5";
        hash = "sha256-sc5s6Fjjg6ZauQbQJxJc3Ct9fP+mwv1h/1SRb6mD4+Q=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/pybind/pybind11_json.git";
          to = "URL ${sources."pybind11_json_vendor/pybind11_json"}";
        }
      ];
    };
    "pybind11_json_vendor/pybind11_json" = substituteSource {
      src = fetchgit {
        name = "pybind11_json-source";
        url = "https://github.com/pybind/pybind11_json.git";
        rev = "0fbbe3bbb27bd07a5ec7d71cbb1f17eaf4d37702";
        hash = "sha256-GQldzT1YU6I1s1RFfzNIJNaIY/LsrsTevoaUoz1SK+Y=";
      };
    };
  });
  meta = {
    description = "A vendor package for pybind11_json for Modern C++";
  };
})
