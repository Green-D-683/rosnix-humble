{
  ament-cmake-auto,
  ament-cmake-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "talos_description_inertial";
  version = "2.9.1-1";
  src = finalAttrs.passthru.sources."talos_description_inertial";
  nativeBuildInputs = [ ament-cmake-auto ament-cmake-python ];
  propagatedNativeBuildInputs = [ xacro ];
  buildInputs = [ ament-cmake-auto ament-cmake-python ];
  propagatedBuildInputs = [ xacro ];
  passthru.sources = mkSourceSet (sources: {
    "talos_description_inertial" = substituteSource {
      src = fetchgit {
        name = "talos_description_inertial-source";
        url = "https://github.com/pal-gbp/talos_robot-release.git";
        rev = "f2ae2d9e61fd1a029ede99f68523d1e5e6b11a8c";
        hash = "sha256-C55q/I8cFUDsSZ0uVi5rtxvHwqGUggUgA/l6hzcuw9c=";
      };
    };
  });
  meta = {
    description = "Inertial parameters of talos";
  };
})
