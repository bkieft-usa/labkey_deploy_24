#!/bin/bash

# Check if the correct number of arguments was provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 lims_version_number lims_deploy_directory"
    exit 1
fi

# Construct the URL
url="https://lk-binaries.s3-us-west-2.amazonaws.com/downloads/release/community/${1%%-*}/LabKey$1-community-embedded.tar.gz"

# Download the file
curl -o ~/Downloads/$(basename $url) $url

# Move to the labkey repo directory
tar -xzf ~/Downloads/$(basename $url) --include='LabKey*labkeyServer*.jar' --strip-components 1 -C $2