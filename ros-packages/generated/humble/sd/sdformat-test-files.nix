{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "sdformat_test_files";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."sdformat_test_files";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "sdformat_test_files" = substituteSource {
      src = fetchgit {
        name = "sdformat_test_files-source";
        url = "https://github.com/ros2-gbp/sdformat_urdf-release.git";
        rev = "dbaf4d1985698ef3b2a69c5e1684d61f70aa2ba6";
        hash = "sha256-+3nL+Njboe0apHQrf0wM7r53YuOAoG8MjCOOoyhCG1c=";
      };
    };
  });
  meta = {
    description = "\n    Example SDFormat XML files for testing tools using hthis format.\n  ";
  };
})
