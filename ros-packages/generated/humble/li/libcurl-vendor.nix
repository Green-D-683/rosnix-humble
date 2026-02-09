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
  pname = "libcurl_vendor";
  version = "3.1.3-1";
  src = finalAttrs.passthru.sources."libcurl_vendor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" "file" "pkg-config" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "curl" "file" "pkg-config" ]; };
  passthru.sources = mkSourceSet (sources: {
    "libcurl_vendor" = substituteSource {
      src = fetchgit {
        name = "libcurl_vendor-source";
        url = "https://github.com/ros2-gbp/resource_retriever-release.git";
        rev = "a32f2445bff340fb93ac15f0894d5103ae530723";
        hash = "sha256-mPtGBNRTMd/Lq4mZV3pHHjcBhT2yWLLABN+2FoaHvN8=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/curl/curl/releases/download/curl-7_81_0/curl-7.81.0.tar.gz";
          to = "URL ${sources."libcurl_vendor/curl-7"}";
        }
      ];
    };
    "libcurl_vendor/curl-7" = substituteSource {
      src = fetchzip {
        name = "curl-7-source";
        url = "https://github.com/curl/curl/releases/download/curl-7_81_0/curl-7.81.0.tar.gz";
        hash = "sha256-M7WqwP0fyguHoi4ObDOAqJODLkb9hqjHI9cGMoJ9YQ0=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around libcurl, it provides a fixed CMake module and an ExternalProject build of it.\n  ";
  };
})
