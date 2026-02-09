{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "popf";
  version = "0.0.14-1";
  src = finalAttrs.passthru.sources."popf";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "bison" "coinor-libcbc-dev" "coinor-libcgl-dev" "coinor-libclp-dev" "coinor-libcoinutils-dev" "flex" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "bison" "coinor-libcbc-dev" "coinor-libcgl-dev" "coinor-libclp-dev" "coinor-libcoinutils-dev" "flex" ]; };
  passthru.sources = mkSourceSet (sources: {
    "popf" = substituteSource {
      src = fetchgit {
        name = "popf-source";
        url = "https://github.com/fmrico/popf-release.git";
        rev = "17394a4bbdbb21f29f7bfe2ac5d51939fb00ec5e";
        hash = "sha256-5QAvnX2e+4KCF60pKDJZXU0toOzZd/35wJT/y9rLPCg=";
      };
    };
  });
  meta = {
    description = "The POPF package";
  };
})
