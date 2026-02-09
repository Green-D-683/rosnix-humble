{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kortex_api";
  version = "0.2.3-1";
  src = finalAttrs.passthru.sources."kortex_api";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "kortex_api" = substituteSource {
      src = fetchgit {
        name = "kortex_api-source";
        url = "https://github.com/ros2-gbp/ros2_kortex-release.git";
        rev = "9eec7ac863f6a7d5c8d341f831659eddb4afd91e";
        hash = "sha256-V+62wEnEvHv2Ihw+m9FraO8s/bfWBu/wqoGkAmXU15s=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://artifactory.kinovaapps.com:443/artifactory/generic-public/kortex/API/2.5.0/linux_x86-64_x86_gcc.zip";
          to = "URL ${sources."kortex_api/linux_x86-64_x86_gcc"}";
        }
      ];
    };
    "kortex_api/linux_x86-64_x86_gcc" = substituteSource {
      src = fetchzip {
        name = "linux_x86-64_x86_gcc-source";
        url = "https://artifactory.kinovaapps.com:443/artifactory/generic-public/kortex/API/2.5.0/linux_x86-64_x86_gcc.zip";
        hash = "sha256-+fUMtXCoThItleO1C2jTZfK6DP/Z7dVJx26WWbBQ9Uc=";
      };
    };
  });
  meta = {
    description = "kortex_api";
  };
})
