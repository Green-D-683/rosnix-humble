{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  splsm-7,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "splsm_7_conversion";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."splsm_7_conversion";
  propagatedNativeBuildInputs = [ splsm-7 ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-construct" ]; };
  propagatedBuildInputs = [ splsm-7 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-construct" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "splsm_7_conversion" = substituteSource {
      src = fetchgit {
        name = "splsm_7_conversion-source";
        url = "https://github.com/ros2-gbp/r2r_spl-release.git";
        rev = "0b5b18c3cfff1fc55b0f2318a801f021207f5347";
        hash = "sha256-+ByB7SfUuMBwq94GLSUN0Kn/gh4NyH7UnJhS9AsVhf8=";
      };
    };
  });
  meta = {
    description = "Converts Standard Platform League Standard Message V7 between ROS msg and UDP raw bytes";
  };
})
