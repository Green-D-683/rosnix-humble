{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  performance-test-fixture,
  rcpputils,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "libyaml_vendor";
  version = "1.2.2-2";
  src = finalAttrs.passthru.sources."libyaml_vendor";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common performance-test-fixture rcpputils ];
  passthru.sources = mkSourceSet (sources: {
    "libyaml_vendor" = substituteSource {
      src = fetchgit {
        name = "libyaml_vendor-source";
        url = "https://github.com/ros2-gbp/libyaml_vendor-release.git";
        rev = "6b016f94f158b7ab8e9775a7812aad155ea8e5ce";
        hash = "sha256-T5lFkF1emYzuuMStlx2KaxQi3nBCsnHhEmB9UBs1FDI=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/yaml/libyaml.git";
          to = "URL ${sources."libyaml_vendor/libyaml"}";
        }
      ];
    };
    "libyaml_vendor/libyaml" = substituteSource {
      src = fetchgit {
        name = "libyaml-source";
        url = "https://github.com/yaml/libyaml.git";
        rev = "2c891fc7a770e8ba2fec34fc6b545c672beb37e6";
        hash = "sha256-S7PnooyfyAsIiRAlEPGYkgkVACGaBaCItuqOwrq2+qM=";
      };
    };
  });
  meta = {
    description = "Vendored version of libyaml.";
  };
})
