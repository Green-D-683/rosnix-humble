{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "r2r_spl_test_interfaces";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."r2r_spl_test_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "r2r_spl_test_interfaces" = substituteSource {
      src = fetchgit {
        name = "r2r_spl_test_interfaces-source";
        url = "https://github.com/ros2-gbp/r2r_spl-release.git";
        rev = "72d177cde182a940e4b31715c410befb28716085";
        hash = "sha256-Qxrk7JWwiwAko7EpogOMMuq5Ur8ZYA1ziIuII5y8PWc=";
      };
    };
  });
  meta = {
    description = "Messages for testing r2r_spl";
  };
})
