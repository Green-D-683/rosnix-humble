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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tlsf";
  version = "0.7.0-2";
  src = finalAttrs.passthru.sources."tlsf";
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tlsf" = substituteSource {
      src = fetchgit {
        name = "tlsf-source";
        url = "https://github.com/ros2-gbp/tlsf-release.git";
        rev = "77ce2b324b10579e8c09875b3da7de51811693ef";
        hash = "sha256-Gaa53l1Yew9zgTyLFtPie+iQ4w68RsHQ1lJQhVNX6EI=";
      };
    };
  });
  meta = {
    description = "TLSF allocator version 2.4.6";
  };
})
