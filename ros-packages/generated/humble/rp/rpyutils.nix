{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rpyutils";
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."rpyutils";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rpyutils" = substituteSource {
      src = fetchgit {
        name = "rpyutils-source";
        url = "https://github.com/ros2-gbp/rpyutils-release.git";
        rev = "5fa3a64c6456385e6f4297f4e44c84a203716d1c";
        hash = "sha256-4NH/z+P9aIXMdTkM8SqCwtfpzXbnSuHcfzZP639NDDw=";
      };
    };
  });
  meta = {
    description = "Package containing various utility types and functions for Python";
  };
})
