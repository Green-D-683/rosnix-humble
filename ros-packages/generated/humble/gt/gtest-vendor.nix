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
  pname = "gtest_vendor";
  version = "1.10.9006-1";
  src = finalAttrs.passthru.sources."gtest_vendor";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gtest_vendor" = substituteSource {
      src = fetchgit {
        name = "gtest_vendor-source";
        url = "https://github.com/ros2-gbp/googletest-release.git";
        rev = "f403d629bdb20e62250d950af6edcc1e935a16ba";
        hash = "sha256-ttJhYBX+bT13D8COATsTw1s1gOLEpJvaL8UACmAko5Q=";
      };
    };
  });
  meta = {
    description = "The package provides GoogleTest.";
  };
})
