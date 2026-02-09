{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fmi-adapter,
  launch,
  launch-ros,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fmi_adapter_examples";
  version = "2.1.1-1";
  src = finalAttrs.passthru.sources."fmi_adapter_examples";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ fmi-adapter launch launch-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ fmi-adapter launch launch-ros ];
  passthru.sources = mkSourceSet (sources: {
    "fmi_adapter_examples" = substituteSource {
      src = fetchgit {
        name = "fmi_adapter_examples-source";
        url = "https://github.com/ros2-gbp/fmi_adapter-release.git";
        rev = "283b188b0d72435a2a745076791bf6e56274154b";
        hash = "sha256-R5kjXvGqUx+ux+q1zgh54sd5aNSXWSJ1edV01iOh5Fc=";
      };
    };
  });
  meta = {
    description = "Provides small examples for use of the fmi_adapter package";
  };
})
