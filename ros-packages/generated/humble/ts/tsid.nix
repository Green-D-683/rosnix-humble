{
  ament-cmake,
  buildCmakePackage,
  eigenpy,
  eiquadprog,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pinocchio,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "tsid";
  version = "1.9.0-1";
  src = finalAttrs.passthru.sources."tsid";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake eigenpy eiquadprog pinocchio ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "doxygen" "git" "graphviz" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake eigenpy eiquadprog pinocchio ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "doxygen" "git" "graphviz" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tsid" = substituteSource {
      src = fetchgit {
        name = "tsid-source";
        url = "https://github.com/ros2-gbp/tsid-release.git";
        rev = "3eab18df8160eaba1598d8bd4ed9cbe43842dd1f";
        hash = "sha256-gw+gl+yFjjZJJUZzN5UIx4FrcFDwGgARYxZCc6CYCuc=";
      };
    };
  });
  meta = {
    description = "\n    Efficient Task Space Inverse Dynamics (TSID) based on Pinocchio\n  ";
  };
})
