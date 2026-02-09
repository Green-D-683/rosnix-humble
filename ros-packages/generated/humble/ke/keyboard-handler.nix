{
  ament-cmake,
  ament-cmake-gmock,
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
  pname = "keyboard_handler";
  version = "0.0.5-1";
  src = finalAttrs.passthru.sources."keyboard_handler";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "keyboard_handler" = substituteSource {
      src = fetchgit {
        name = "keyboard_handler-source";
        url = "https://github.com/ros2-gbp/keyboard_handler-release.git";
        rev = "e36b47c7a817f4f13a53124a0fcc0a4230d24589";
        hash = "sha256-YkqOrcqMX8vmBZm2llfopDtrE75rah4TxGZCAiDfWpo=";
      };
    };
  });
  meta = {
    description = "Handler for input from keyboard";
  };
})
