# Overview

This Dockerfile builds an image for SML/NJ (Standard ML of New Jersey), based on the Phusion base image `phusion/baseimage`. It downloads and compiles SML/NJ from source from the University of Chicago, based on the instructions given at [http://www.smlnj.org/dist/working/110.78/INSTALL](http://www.smlnj.org/dist/working/110.78/INSTALL).

# Running SML

SML/NJ can be run from the resulting image by calling `docker run --rm -i -t msgodf/smlnj /root/bin/sml)`.

# Building native executables

SML/NJ comes with CM (Compiler Manager), which allows you to specify the files that you want to include and builds a _heap image_ that can be run using `sml`. This heap image can be converted to a native executable using the `heap2exec` command. The following instructions show how to build a 'Hello World!' executable.

Create the following two files:

`hello-world.sml`
```
structure HelloWorld =
struct
    fun main(program_name, args) =
        let val _ = print "Hello World!\n"
        in
            1
        end;
end;
```

`hello-world.cm`
```
Group is
    hello-world.sml

    $/basis.cm
```

Run the following commands from inside the container:

```
ml-build hello-world.cm HelloWorld.main hello-world.heap

heap2exec hello-world.heap.* hello-world
```

The result is a file, `hello-world`, that should be an executable binary which prints "Hello World!" to stdout.
