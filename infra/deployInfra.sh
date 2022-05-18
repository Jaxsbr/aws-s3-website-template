_defaultColor=$(tput sgr0)
_infoColor=$(tput setaf 3)
_updateCommand="update-stack"
_createCommand="create-stack"

function printInfo {
    printf "${_infoColor}$1${_defaultColor}"
}

function printInfoLine {
    printInfo "$1 \n"
}

function executeStackCommand {
    printInfoLine "Stack Command '$1' Starting..."
    aws cloudformation "$1" \
    --stack-name MyS3BucketWebsiteStack \
    --template-body file://./app.yaml \
    --profile your-aws-profile \
    --region us-east-1
}

printInfoLine "UI Deploy Script Starting..."

printInfoLine "Specify if you want to update or create this stack (update/create)"
read stackCommand

if [ "$stackCommand" == 'create' ]; then
    executeStackCommand $_createCommand
fi

if [ "$stackCommand" == "update" ]; then
    executeStackCommand $_updateCommand
fi

if [ "$stackCommand" != "update" ] && [ "$stackCommand" != "create" ]; then
    printInfoLine "Nothing selected, Goodbey!"
    exit 1
fi