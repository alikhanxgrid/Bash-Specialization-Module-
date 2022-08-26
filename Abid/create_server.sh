
# exit when any command fails
    set -e

    ENV_FILE=""
    SSH_CONFIG=~/.ssh/config
    SERVER_NAMES=()
    SERVER_NAMES_FILE="server-names.txt"

    #selection based on flags provided
    while getopts 'f:' OPTION; do
    case "$OPTION" in
    f)
        ENV_FILE="$OPTARG" #Save the flag value in ENV_FILE var
        #If file provided by the flag exists than proceed
        if test -f "$ENV_FILE"; then
        echo "$ENV_FILE exists."

        source $ENV_FILE #load variables from environment file

        #provide env variables to the vagrantfile
        N_SERVER=$N_SERVERS vagrant up

        #Create ssh config file if it doesn't exist
        if ! test -f "$SSH_CONFIG"; then
            touch $SSH_CONFIG
        else
            echo '' >$SSH_CONFIG
        fi

        #Get ssh-config for each VM add it to SSH_CONFIG file

        echo "$(N_SERVER=$N_SERVERS vagrant ssh-config)" >$SSH_CONFIG

        #Add server names to an array
        output="$(N_SERVER=$N_SERVERS vagrant ssh-config | grep -i "Host ")"
        readarray -t server_names <<<"$output"
        for name in ${server_names[@]}; do
            if ! [ "$name" == "Host" ]; then
            SERVER_NAMES+=($name)
            fi

        done
        #save the array to a file
        { echo "${SERVER_NAMES[*]}"; } >$SERVER_NAMES_FILE
        else
        echo "$ENV_FILE does not exist."
        fi
        ;;
    ?)
        #print in case of incorrect flags
        echo "script usage: create-servers.sh [-f filename]" >&2
        exit 1
        ;;
    esac
    done
    shift "$(($OPTIND - 1))"
