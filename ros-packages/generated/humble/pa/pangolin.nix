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
  pname = "pangolin";
  version = "0.9.1-1";
  src = finalAttrs.passthru.sources."pangolin";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libglew-dev" "libpng-dev" "libturbojpeg" "libxkbcommon-dev" "python3-dev" "wayland" "wayland-dev" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libglew-dev" "libpng-dev" "libturbojpeg" "libxkbcommon-dev" "python3-dev" "wayland" "wayland-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "pangolin" = substituteSource {
      src = fetchgit {
        name = "pangolin-source";
        url = "https://github.com/ros2-gbp/Pangolin-release.git";
        rev = "71783d8f4732824a7cb32186092886d28a378552";
        hash = "sha256-VAE6VKDuVagjFsw1q6X/hpGUYbDSIx+Os9F+/76bo08=";
      };
    };
  });
  meta = {
    description = "Pangolin is a set of lightweight and portable utility libraries for prototyping 3D, numeric or video based programs and algorithms.";
  };
})
