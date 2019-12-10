{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_example1_haskell (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/mnt/d/til/Haskell/example1/example1-haskell/.stack-work/install/x86_64-linux/4728184d9c8f565972d6b16be90dbb378e39b5f04520a643809a55e08d87b32d/8.6.5/bin"
libdir     = "/mnt/d/til/Haskell/example1/example1-haskell/.stack-work/install/x86_64-linux/4728184d9c8f565972d6b16be90dbb378e39b5f04520a643809a55e08d87b32d/8.6.5/lib/x86_64-linux-ghc-8.6.5/example1-haskell-0.1.0.0-K2z4pnqEG5U7IpVM6ec6IO-example1-haskell"
dynlibdir  = "/mnt/d/til/Haskell/example1/example1-haskell/.stack-work/install/x86_64-linux/4728184d9c8f565972d6b16be90dbb378e39b5f04520a643809a55e08d87b32d/8.6.5/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/mnt/d/til/Haskell/example1/example1-haskell/.stack-work/install/x86_64-linux/4728184d9c8f565972d6b16be90dbb378e39b5f04520a643809a55e08d87b32d/8.6.5/share/x86_64-linux-ghc-8.6.5/example1-haskell-0.1.0.0"
libexecdir = "/mnt/d/til/Haskell/example1/example1-haskell/.stack-work/install/x86_64-linux/4728184d9c8f565972d6b16be90dbb378e39b5f04520a643809a55e08d87b32d/8.6.5/libexec/x86_64-linux-ghc-8.6.5/example1-haskell-0.1.0.0"
sysconfdir = "/mnt/d/til/Haskell/example1/example1-haskell/.stack-work/install/x86_64-linux/4728184d9c8f565972d6b16be90dbb378e39b5f04520a643809a55e08d87b32d/8.6.5/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "example1_haskell_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "example1_haskell_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "example1_haskell_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "example1_haskell_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "example1_haskell_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "example1_haskell_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
