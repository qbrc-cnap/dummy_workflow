workflow Main {
    String z

    call sleep {
        input:
            z = z
    }

    output {
        File output = sleep.my_output
    }

    meta {
        workflow_title : "Dummy workflow"
        workflow_short_description : "For testing..."
        workflow_long_description : "For testing"
    }
}

task sleep {

    String z
    Int disk_size = 10
    command {
        echo "start"
        echo ${z} >> "something.txt"
        echo "stop"
    }

    output {
         File my_output = "something.txt"        
    }

    runtime {
        docker: "docker.io/blawney/kallisto:v0.0.1"
        cpu: 2
        memory: "4 G"
        disks: "local-disk " + disk_size + " HDD"
        preemptible: 0
    }
}
