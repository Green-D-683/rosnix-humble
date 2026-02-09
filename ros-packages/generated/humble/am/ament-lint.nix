{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ament_lint";
  version = "0.12.14-1";
  src = finalAttrs.passthru.sources."ament_lint";
  passthru.sources = mkSourceSet (sources: {
    "ament_lint" = substituteSource {
      src = fetchgit {
        name = "ament_lint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "90e90e64eba7053fdba0365c90cf6be0951823cf";
        hash = "sha256-GaZIM1Gww4gIZaOrY9Vcdlw3Tb5pqKQeSeeH4hAqwrk=";
      };
    };
  });
  meta = {
    description = "\n    Providing common API for ament linter packages.\n  ";
  };
})
