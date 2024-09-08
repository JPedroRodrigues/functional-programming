# Functional Programming

## Learning Haskell

If you want to learn Haskell from scratch, just like me, let's break down how to install it first:

### 1. Installation:

Installation is pretty simple. If you are using:

- Windows:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force;[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; try { & ([ScriptBlock]::Create((Invoke-WebRequest https://www.haskell.org/ghcup/sh/bootstrap-haskell.ps1 -UseBasicParsing))) -Interactive -DisableCurl } catch { Write-Error $_ }
```

- Unix-like systems:

Make sure you have installed the following libraries I'm going to show bellow. These are dependencies to get the GHCup running as it is suposed to be. For more details, check [here](https://www.haskell.org/ghcup/install/#system-requirements). In my case (Debian 12.7) I will install those dependencies

```bash
sudo apt update
sudo apt install curl build-essential libffi-dev libffi8 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5
```

```bash
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

Consider running those commands above in your terminal.

### 2. Getting Started

> [!NOTE]
> The original step-by-step guide can be easily find at the [ghcup website](https://www.haskell.org/ghcup/steps/). What I am writing here is just a little briefing. My main goal here is to make it simpler for you.

I'm assuming you are creating your files and studying in a Unix-like system, just in case you find here a cmd you are not used to.

#### Compiling Programs with GHC

The **Glasgow Haskell Compiler (GHC)** "can be used to compile Haskell modules and programs into native executables and libraries".

> [!NOTE]
> GCH assumes you have a "main" module in your `.hs` program. If you don't use one, it will raise an exception.

Let's create our hello world example, `hello.hs`:
```bash
touch hello.hs && code hello.hs
```

```haskell
main = putStrLn "Hello, World!"
```

Now, just run your program:

```bash
./hello
Hello, World!
```

Alternatively, you can interpret the file using the `runghc`
```bash
runghc hello.hs
Hello, World!
```

> [!WARNING]
> This is not a real warning. I'm just here to let you know that you can turn on warnings using the `-Wall` flag.
> This will help you improve your code in some other ways.

#### GHCI - The Interactive Environment

It's also called a **Read-Evaluate-Print Loop (REPL)**. It's pretty simple to use and you can even create functions inside it.

```bash
ghci
GHCi, version 9.4.8: https://www.haskell.org/ghc/  :? for help
```

```bash
ghci> double n = n * 2
ghci> double 2
4
```

Also, you can load your haskell files into your environment and run it using the `:load` or `:l` command.

```haskell
-- my fat.hs program
fat 0 = 1
fat n = n * fat(n - 1)
```

```bash
ghci> :l fat.hs
ghci> fat 3
6
```