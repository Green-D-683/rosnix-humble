{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "launch_xml";
  version = "1.0.14-1";
  src = finalAttrs.passthru.sources."launch_xml";
  propagatedNativeBuildInputs = [ launch ];
  propagatedBuildInputs = [ launch ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch_xml" = substituteSource {
      src = fetchgit {
        name = "launch_xml-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "da1a217b0add400d8b81448625bd1b8660467820";
        hash = "sha256-Czs8sZE0QqkuvZOhejBB7hYOn0hdUeU4fi5cfl4QW6Y=";
      };
    };
  });
  meta = {
    description = "XML frontend for the launch package.";
  };
})
