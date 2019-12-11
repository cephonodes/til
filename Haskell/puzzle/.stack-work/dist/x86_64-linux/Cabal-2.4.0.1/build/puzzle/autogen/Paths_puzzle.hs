{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_puzzle (
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

bindir     = "/home/yuki02/til/Haskell/puzzle/.stack-work/install/x86_64-linux/fdbe0fe1749f3b44717f22280fa5d743e897939e174d11ada93fc0895b440a47/8.6.5/bin"
libdir     = "/home/yuki02/til/Haskell/puzzle/.stack-work/install/x86_64-linux/fdbe0fe1749f3b44717f22280fa5d743e897939e174d11ada93fc0895b440a47/8.6.5/lib/x86_64-linux-ghc-8.6.5/puzzle-0.1.0.0-FP00SSupDMq1s9sd25ocWs-puzzle"
dynlibdir  = "/home/yuki02/til/Haskell/puzzle/.stack-work/install/x86_64-linux/fdbe0fe1749f3b44717f22280fa5d743e897939e174d11ada93fc0895b440a47/8.6.5/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/home/yuki02/til/Haskell/puzzle/.stack-work/install/x86_64-linux/fdbe0fe1749f3b44717f22280fa5d743e897939e174d11ada93fc0895b440a47/8.6.5/share/x86_64-linux-ghc-8.6.5/puzzle-0.1.0.0"
libexecdir = "/home/yuki02/til/Haskell/puzzle/.stack-work/install/x86_64-linux/fdbe0fe1749f3b44717f22280fa5d743e897939e174d11ada93fc0895b440a47/8.6.5/libexec/x86_64-linux-ghc-8.6.5/puzzle-0.1.0.0"
sysconfdir = "/home/yuki02/til/Haskell/puzzle/.stack-work/install/x86_64-linux/fdbe0fe1749f3b44717f22280fa5d743e897939e174d11ada93fc0895b440a47/8.6.5/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "puzzle_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "puzzle_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "puzzle_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "puzzle_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "puzzle_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "puzzle_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
