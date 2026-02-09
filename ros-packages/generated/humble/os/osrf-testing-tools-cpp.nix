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
  pname = "osrf_testing_tools_cpp";
  version = "1.5.2-1";
  src = finalAttrs.passthru.sources."osrf_testing_tools_cpp";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "osrf_testing_tools_cpp" = substituteSource {
      src = fetchgit {
        name = "osrf_testing_tools_cpp-source";
        url = "https://github.com/ros2-gbp/osrf_testing_tools_cpp-release.git";
        rev = "9ed6c1929ba2c9ad896e898dc92f3d0aaf758ae6";
        hash = "sha256-du4lfHqdmHOrL+pPJsvjMzkstRUrj//VqIabWR6SP2Y=";
      };
    };
  });
  meta = {
    description = "Testing tools for C++, and is used in various OSRF projects.";
  };
})
