version 1.1

import "local.wdl" as local alias Foo as Bar
import "https://example.com/remote.wdl" as remote alias Baz as Blorf

struct Example1 {
    Float f
    Map[String, Int] m
}

struct Example2 {
    String s
    Int? i
    Array[File?]+ a
    Example1 e
    Object o
    Pair[String, String] p
}

workflow Workflow1 {
    input {
        String s
        Int i = ceil(0)
        Example2? ex
    }

    Float f = i + 1.0
    Array[File] file_array = if defined(ex) then select_all(select_first([ex]).a) else []

    call local.foo
    call local.foo as bar {}
    call local.baz {
        input:
    }
    call local.qux {
        input:
            x = 1,
            y = false
    }

    if (1 > 2) {
        scatter (file in file_array) {
            call remote.waldo {
                input: file
            }
        }
    }

    output {
        File f = task1.name_file
    }

    meta {
        description: "Test workflow"
        test: true
        size: 10
        numbers: [1, 2, 3]
        keywords: {
            a: 1.0,
            b: -1
        }
        x: null
    }
}

task Task1 {
    parameter_meta {
        name: "name of the file"
    }

    input {
        String name
        Example2? ex
        String docker_image
    }

    command <<<
        set -euxo pipefail

        echo "name: ~{name}"
        echo "ex: ~{default="" ex}" \
            | cat
        
        echo "\>>>"
        
        if [[ "test" =~ \.fastq ]]; then
            echo "yes"
        else
            echo "no"
        fi
        
        echo "~{sep=" " ['John', 'Doe']}"
        echo "~{sep(" ", ['John', 'Doe'])}"
        echo "~{if defined(ex) then "yes" else "no"}"
    >>>

    output {
        File name_file = stdout()
    }
    
    RuntimeAttr default_attr = object {
        cpu_cores:          2,
        mem_gb:             16,
        disk_gb:            disk_size,
        boot_disk_gb:       20,
        preemptible_tries:  3,
        max_retries:        2,
        docker:             "debian:bookworm-slim"
    }
    RuntimeAttr runtime_attr = select_first([runtime_attr_override, default_attr])
    

    runtime {
        container: docker_image
        disks: "local-disk 10 SSD"
    }

    meta {
        description: "write name to file"
    }
}
