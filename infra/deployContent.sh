_defaultColor=$(tput sgr0)
_infoColor=$(tput setaf 3)

function printInfo {
    printf "${_infoColor}$1${_defaultColor}"
}

function printInfoLine {
    printInfo "$1 \n"
}

printInfoLine "Sync S3 buck starting..."

aws s3 sync '/website-source-directory' 's3://MyS3BucketWebsite' \
--acl public-read \
--profile your-aws-profile \
--region us-east-1

printInfoLine "Sync S3 buck completed..."