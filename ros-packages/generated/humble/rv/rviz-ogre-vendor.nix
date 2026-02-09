{
  ament-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_ogre_vendor";
  version = "11.2.25-1";
  src = finalAttrs.passthru.sources."rviz_ogre_vendor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" "libfreetype6" "libfreetype6-dev" "libglew-dev" "libx11-dev" "libxaw" "libxrandr" "opengl" "pkg-config" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "git" "libfreetype6" "libfreetype6-dev" "libglew-dev" "libx11-dev" "libxaw" "libxrandr" "opengl" "pkg-config" ]; };
  checkInputs = [ ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "rviz_ogre_vendor" = substituteSource {
      src = fetchgit {
        name = "rviz_ogre_vendor-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "382826a329c4cd41fbdccc217bdeee8e0af8d643";
        hash = "sha256-eCmzYE3jYO3re9Ez3PTVYBpTJcdy/EhpC6T7pwKQ2qU=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/OGRECave/ogre/archive/v1.12.1.zip";
          to = "URL ${sources."rviz_ogre_vendor/v1"}";
        }
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/freetype/freetype/archive/refs/tags/VER-2-6-5.tar.gz";
          to = "URL ${sources."rviz_ogre_vendor/VER-2-6-5"}";
        }
        {
          path = "CMakeLists.txt";
          from = "URL https://www.zlib.net/fossils/zlib-1.2.11.tar.gz";
          to = "URL ${sources."rviz_ogre_vendor/zlib-1"}";
        }
      ];
    };
    "rviz_ogre_vendor/VER-2-6-5" = substituteSource {
      src = fetchzip {
        name = "VER-2-6-5-source";
        url = "https://github.com/freetype/freetype/archive/refs/tags/VER-2-6-5.tar.gz";
        hash = "sha256-I7eevQ4bSEyHVgr0cqp3UMESqwV2VG+wSQfgE9BqOvw=";
      };
    };
    "rviz_ogre_vendor/v1" = substituteSource {
      src = fetchzip {
        name = "v1-source";
        url = "https://github.com/OGRECave/ogre/archive/v1.12.1.zip";
        hash = "sha256-FHW0+DZhw6MLlhjh4DRYhA+6vBBXMN9K6GEVoR6P5kM=";
      };
      substitutions = [
        {
          path = "CMake/Dependencies.cmake";
          from = "DOWNLOAD\n            https://download.savannah.gnu.org/releases/freetype/freetype-2.9.tar.gz";
          to = "DOWNLOAD file://${sources."rviz_ogre_vendor/v1/freetype-2"}";
        }
        {
          path = "CMake/Dependencies.cmake";
          from = "DOWNLOAD\n            https://libsdl.org/release/SDL2-2.0.8.tar.gz";
          to = "DOWNLOAD file://${sources."rviz_ogre_vendor/v1/SDL2-2"}";
        }
        {
          path = "CMake/Dependencies.cmake";
          from = "DOWNLOAD\n        https://github.com/gdraheim/zziplib/archive/develop.zip";
          to = "DOWNLOAD file://${sources."rviz_ogre_vendor/v1/develop"}";
        }
      ];
    };
    "rviz_ogre_vendor/v1/SDL2-2" = substituteSource {
      src = fetchurl {
        name = "SDL2-2-source";
        url = "https://libsdl.org/release/SDL2-2.0.8.tar.gz";
        hash = "sha256-7cd8VzCGYdV26EM0TYY44CWngYv/c/j7+rCcPF/Qkuw=";
      };
    };
    "rviz_ogre_vendor/v1/develop" = substituteSource {
      src = fetchurl {
        name = "develop-source";
        url = "https://github.com/gdraheim/zziplib/archive/develop.zip";
        hash = "sha256-hmbzUNK7po0+JWrPIkxUN20XOxc6qWIDBn5xjoiapuc=";
      };
    };
    "rviz_ogre_vendor/v1/freetype-2" = substituteSource {
      src = fetchurl {
        name = "freetype-2-source";
        url = "https://download.savannah.gnu.org/releases/freetype/freetype-2.9.tar.gz";
        hash = "sha256-vzgOTXxPO1scGnsr86u5Z72l6atIDQ32VuDgjFAZxeY=";
      };
    };
    "rviz_ogre_vendor/zlib-1" = substituteSource {
      src = fetchzip {
        name = "zlib-1-source";
        url = "https://www.zlib.net/fossils/zlib-1.2.11.tar.gz";
        hash = "sha256-AQIoy96jcdmKs/F4GVqDFXxcZ7c66GF+yalHg3ALEyU=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around ogre3d, it provides a fixed CMake module and an ExternalProject build of ogre.\n  ";
  };
})
