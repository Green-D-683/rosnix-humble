{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "test_interface_files";
  version = "0.9.1-2";
  src = finalAttrs.passthru.sources."test_interface_files";
  nativeBuildInputs = [ ament-cmake-core ];
  buildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "test_interface_files" = substituteSource {
      src = fetchgit {
        name = "test_interface_files-source";
        url = "https://github.com/ros2-gbp/test_interface_files-release.git";
        rev = "e3d0c4e82b4ae8f07faa3c45d235a70313fb2e38";
        hash = "sha256-QNZlkUZcUAHAOEUnh0h7Ba8nKb7O6zH6wj36lqQKQSo=";
      };
    };
  });
  meta = {
    description = "A package containing message definitions and fixtures used exclusively for testing purposes.";
  };
})
