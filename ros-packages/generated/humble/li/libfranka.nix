{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pinocchio,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "libfranka";
  version = "0.20.4-1";
  src = finalAttrs.passthru.sources."libfranka";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ pinocchio ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "fmt" "libpoco-dev" "tinyxml2" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ pinocchio ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "fmt" "libpoco-dev" "tinyxml2" ]; };
  passthru.sources = mkSourceSet (sources: {
    "libfranka" = substituteSource {
      src = fetchgit {
        name = "libfranka-source";
        url = "https://github.com/frankaemika/libfranka-release.git";
        rev = "419a3409e60b7150fbbdf095d1b65921ab971a28";
        hash = "sha256-tiAOCgk49CBNA/bAeCNusyrpuOp6DeC3itjpk8qwoF8=";
      };
      substitutions = [
        {
          path = "cmake/FetchFMT.cmake";
          from = "GIT_REPOSITORY https://github.com/fmtlib/fmt";
          to = "URL ${sources."libfranka/fmt"}";
        }
      ];
    };
    "libfranka/fmt" = substituteSource {
      src = fetchgit {
        name = "fmt-source";
        url = "https://github.com/fmtlib/fmt";
        rev = "0c9fce2ffefecfdce794e1859584e25877b7b592";
        hash = "sha256-IKNt4xUoVi750zBti5iJJcCk3zivTt7nU12RIf8pM+0=";
      };
    };
  });
  meta = {
    description = "libfranka is a C++ library for Franka Robotics research robots";
  };
})
