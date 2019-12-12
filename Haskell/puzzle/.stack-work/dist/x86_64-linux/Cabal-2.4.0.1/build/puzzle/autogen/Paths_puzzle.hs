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

bindir     = "/mnt/e/til/Haskell/puzzle/.stack-work/install/x86_64-linux/5b6b051ee0abe8941b0af4a732570ca4adf65b9703d817febb44ab6d8c8659e1/8.6.5/bin"
libdir     = "/mnt/e/til/Haskell/puzzle/.stack-work/install/x86_64-linux/5b6b051ee0abe8941b0af4a732570ca4adf65b9703d817febb44ab6d8c8659e1/8.6.5/lib/x86_64-linux-ghc-8.6.5/puzzle-0.1.0.0-FP00SSupDMq1s9sd25ocWs-puzzle"
dynlibdir  = "/mnt/e/til/Haskell/puzzle/.stack-work/install/x86_64-linux/5b6b051ee0abe8941b0af4a732570ca4adf65b9703d817febb44ab6d8c8659e1/8.6.5/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/mnt/e/til/Haskell/puzzle/.stack-work/install/x86_64-linux/5b6b051ee0abe8941b0af4a732570ca4adf65b9703d817febb44ab6d8c8659e1/8.6.5/share/x86_64-linux-ghc-8.6.5/puzzle-0.1.0.0"
libexecdir = "/mnt/e/til/Haskell/puzzle/.stack-work/install/x86_64-linux/5b6b051ee0abe8941b0af4a732570ca4adf65b9703d817febb44ab6d8c8659e1/8.6.5/libexec/x86_64-linux-ghc-8.6.5/puzzle-0.1.0.0"
sysconfdir = "/mnt/e/til/Haskell/puzzle/.stack-work/install/x86_64-linux/5b6b051ee0abe8941b0af4a732570ca4adf65b9703d817febb44ab6d8c8659e1/8.6.5/etc"

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
