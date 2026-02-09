{
  buildCmakePackage,
  eigenpy,
  fetchgit,
  fetchurl,
  fetchzip,
  hpp-fcl,
  jrl-cmakemodules,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
  urdfdom,
}:
buildCmakePackage (finalAttrs: {
  pname = "pinocchio";
  version = "3.9.0-1";
  src = finalAttrs.passthru.sources."pinocchio";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang" "cmake" ]; };
  propagatedNativeBuildInputs = [ eigenpy hpp-fcl jrl-cmakemodules ros-environment urdfdom ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "doxygen" "eigen" "git" "python3" "python3-numpy" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "clang" "cmake" ]; };
  propagatedBuildInputs = [ eigenpy hpp-fcl jrl-cmakemodules ros-environment urdfdom ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "doxygen" "eigen" "git" "python3" "python3-numpy" ]; };
  passthru.sources = mkSourceSet (sources: {
    "pinocchio" = substituteSource {
      src = fetchgit {
        name = "pinocchio-source";
        url = "https://github.com/ros2-gbp/pinocchio-release.git";
        rev = "b54ef6188b9527f4ae55da129e67f46b703af8f0";
        hash = "sha256-5ILflTXf/5OujAmOEnqFwN7TtMMJJm2HmkGKbj7IFBQ=";
      };
    };
  });
  meta = {
    description = "A fast and flexible implementation of Rigid Body Dynamics algorithms and their analytical derivatives.";
  };
})
